class PlayersController < ApplicationController
    def index
    end
    def create
        if session[:player1].nil? || session[:player12].nil?
            @player = Player.create(player_params)
        end
        
        if session[:player1].nil? 
            session[:player1] = @player.id
            binding.pry
        else
            session[:player2] = @player.id
        end
        session[:active_player]  = session[:player1]
        if session[:player1] && session[:player2]
            redirect_to games_path
        end
        
       
    end
    private
    def player_params
        params.require(:player).permit(:username)
    end
end
