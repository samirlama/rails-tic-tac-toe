class PlayersController < ApplicationController
    def index
        if !params[:sort].nil?
            @distinct_game_player = Gameplayer.sort_by(params[:sort])
        else
            @distinct_game_player = Gameplayer.where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name")
        end

        respond_to do |format|
            format.html {}
            format.js {}
        end

         
        # @games = @game.sort_by {|g| g.count('Distinct g.player_id') }
        # @game_win_table = @game.all.group(:player_id).select("COUNT(DISTINCT player_id), player_id")
    end
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
                # byebug
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



                


        #    if Gameplayer.count  != 0
        #         if Gameplayer.last.status == "waiting"
        #             @player_id = Gameplayer.last.player_id
        #             @player = Player.find(@player_id)
        #             if @player.username == player_params[:username]
        #                 flash[:notice] = "Username already taken for this Game"
        #                 redirect_to "/"
        #             else
        #                 if @new_player.valid?
        #                     @new_player.save
        #                     session[:player] = @new_player.id
        #                     redirect_to new_game_path
        #                 else 
        #                     flash[:notice] = "Username can't be empty."
        #                     redirect_to "/"
        #                 end
        #             end
        #         else
        #             if @new_player.valid?
        #                 @new_player.save
        #                 session[:player] = @new_player.id
        #                 redirect_to new_game_path
        #             else 
        #                 flash[:notice] = "Username can't be empty."
        #                 redirect_to "/"
        #             end
        #         end
        #     else
        #         if @new_player.valid?
        #             @new_player.save
        #             session[:player] = @new_player.id
        #             redirect_to new_game_path
        #         else 
        #             flash[:notice] = "Username can't be empty."
        #             redirect_to "/"
        #         end
        #     end
    end

    private
    def player_params
        params.require(:player).permit(:username)
    end
end
