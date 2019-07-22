class GamesController < ApplicationController
    include ApplicationHelper
    def create
        # if session[:game].blank?
        #     @player = Player.find(session[:player1])
        #     @game = @player.games.create
        #     session[:game] = @game.id
        #     redirect_to game_path(@game.id)
        # else
        #     # binding.pry
        #     @gamelast = Game.last
        #     @player = Player.last
        #     session[:player2] = @player.id
        #     # @player2   = Player.find(session[:player2])
        #     @game2 = Gameplayer.create(game_id: @gamelast.id , player_id: session[:player2])
        #     redirect_to game_path(current_game.id)
        # end
        if Gameplayer.count == 0
            @player = Player.find(session[:player])
            @game = @player.games.create
            session[:game] = @game.id
            redirect_to game_path(@game.id)
        else    
            if Gameplayer.last.status != "waiting"
                @player = Player.find(session[:player])
                @game = @player.games.create
                session[:game] = @game.id
                redirect_to game_path(@game.id)
            else
                @game_id = Gameplayer.last.game_id
                session[:game] = @game_id
                @player = Player.find(session[:player])
                @game = Gameplayer.create(game_id:  @game_id , player_id: session[:player] , status: "playing")
                # @recent_game = Gameplayer.where(game_id: session[:game_id])
                
                # @recent_game.first.update(status: "playing")
                redirect_to game_path(session[:game])
            end
       
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
            session[:player] = nil
            session[:game] = nil
            redirect_to "/" 
    end
end
