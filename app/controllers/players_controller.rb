class PlayersController < ApplicationController
    def index
       @players = Player.all.order("username ASC").paginate(page: params[:page], per_page: 2)
       unless params[:search].nil?
            @players = Player.all.order("username ASC").where('username LIKE ?' , "%#{params[:search]}%").paginate(page: params[:page], per_page: 2)
            # binding.pry
       end
       unless params[:sort].nil?
            if params[:sort] == "active"
                @players = Player.all.order("username ASC").where(status: true).paginate(page: params[:page], per_page: 2)
               
            else
                @players = Player.all.order("username ASC").where(status: false).paginate(page: params[:page], per_page: 2)
                
            end

        end

       respond_to do |format|
            format.html {}
            format.js {}
        end
    end
    
    def create
        @new_player = Player.new(player_params)
        @game_player = Player.find_by(username: player_params[:username]) 
        if Player.where(username: player_params[:username]).exists?
             if Gameplayer.last.status == "waiting"    
                
                @player_id = Gameplayer.last.player_id
                @player = Player.find(@player_id)
                if @player.username == player_params[:username]
                    flash[:notice] = "Username already taken"
                    redirect_to "/"
                else
                        session[:player] = @game_player.id
                        redirect_to new_game_path
                end
            else
                session[:player] = @game_player.id
                redirect_to new_game_path
            end
        else
            if @new_player.valid? 
                @new_player.save
                session[:player] = @new_player.id
                redirect_to new_game_path
            else
                flash[:notice] = "Username cant be empty"
                redirect_to "/"
            end
        end
    end

    def deactivate
        # Player.update_all({status: false} , {id: params[:player_ids]})
        if params[:commit] == "Deactivate"
            Player.where(id: params[:player_ids]).update_all(status: false)
        else
           
            Player.where(id: params[:player_ids]).update_all(status: true)
        end
        redirect_to players_path
s    end

    def update_status
        username = params[:username]
        Player.where(username: username).update(status: params[:status])
    end

    private
    def player_params
        params.require(:player).permit(:username)
        
    end
    
 
   
end
