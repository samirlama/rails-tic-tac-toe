class GamesController < ApplicationController
    include ApplicationHelper
    def create
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
                redirect_to game_path(session[:game])
            end
        end
    end    

    def endgame
        @gameplayer_lose = Gameplayer.where(player_id: session[:active_player] , game_id: current_game)
        @gameplayer_lose.update(game_status: "lose")
        @gameplayer_won = Gameplayer.where(game_id: current_game).where.not(player_id: session[:active_player] )
        @gameplayer_won.update(game_status:  "win")
        session[:player] = nil
        session[:game] = nil
        session[:active_player] = nil
        redirect_to "/" 
    end
end
