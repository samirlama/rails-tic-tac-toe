class PlayersController < ApplicationController
    def create
        # if session[:player1].nil? || session[:player2].nil?
        #     @player = Player.create(player_params)
        # end
        # if session[:player1].nil? 
        #     session[:player1] = @player.id
        #     # binding.pry
        # else
        #     session[:player2] = @player.id
        # end
        # session[:active_player]  = session[:player1]
        # # binding.pry
        # if session[:player1] || session[:player2]
        #     redirect_to new_game_path   
        # end 
        if  session[:player].nil?
         @new_player = Player.new(player_params)
            if Gameplayer.count  == 0
                if Gameplayer.last.status == "waiting"
                    @player_id = Gameplayer.last.player_id
                    @player = Player.find(@player_id)
                    if @player.username == player_params[:username]
                        flash[:notice] = "Username already taken for this Game"
                        redirect_to "/"
                    else
                        if @new_player.valid?
                            @new_player.save
                            session[:player] = @player.id
                            redirect_to new_game_path
                        else 
                            flash[:notice] = "Username can't be empty."
                            redirect_to "/"
                        end
                    end
                end
            else
                if @new_player.valid?
                    @new_player.save
                    session[:player] = @player.id
                    redirect_to new_game_path
                else 
                    flash[:notice] = "Username can't be empty."
                    redirect_to "/"
                end
            end

            
        end
        
       
    end
    private
    def player_params
        params.require(:player).permit(:username)
    end
end
