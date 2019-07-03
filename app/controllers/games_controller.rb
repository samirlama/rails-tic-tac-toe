class GamesController < ApplicationController
    include ApplicationHelper
    def create
        if session[:game].blank?
            @player = Player.find(session[:player1])
            @game = @player.games.create
            session[:game] = @game.id
            redirect_to game_path(@game.id)
        else
            # binding.pry
            @gamelast = Game.last
            @player = Player.last
            session[:player2] = @player.id
            # @player2   = Player.find(session[:player2])
            @game2 = Gameplayer.create(game_id: @gamelast.id , player_id: session[:player2])
            redirect_to game_path(current_game.id)
        end
       
    end
    # def newgame
    #     if !session[:game].blank?
    #         session.delete(:player2)
    #         session.delete(:game)
    #         # binding.pry
    #     end
    #    redirect_to create_new_path
    # end
    def endgame
        if session[:player1] && session[:player2] && session[:game]
            session[:player1] = nil
            session[:player2] = nil
            session[:active_player] = nil
            session[:game] = nil
            redirect_to "/"
        else
            redirect_to "/"
        end
    end
end
