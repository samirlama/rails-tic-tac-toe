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
        # if current_game.winner.present?
        #     # @gameplayer = Gameplayer.where(game_id: current_game).where.not(player_id: session[:active_player])
        #     @gameplayer = Gameplayer.where(game_id: current_game)
        #     if current_game.moves.count == 9
        #         @game = current_game.update(winner: 0)
        #     else 
             
        #         @player_won_id = @gameplayer[0].player_id
        #         @game = current_game.update(winner: @player_won_id)
        #     end

        # session[:player] = nil
        # session[:game] = nil
        # redirect_to "/" 
        # else
        # if Gameplayer.where(game_id: current_game , player_id: session[:active_player])[0].game_status.blank?
            @gameplayer_lose = Gameplayer.where(player_id: session[:active_player] , game_id: current_game)
            @gameplayer_lose.update(game_status: "lose")
            @gameplayer_won = Gameplayer.where(game_id: current_game).where.not(player_id: session[:active_player] )
            byebug
            @gameplayer_won.update(game_status:  "win")
            
        
            session[:player] = nil
            session[:game] = nil
            session[:active_player] = nil
            redirect_to "/" 
                   
         
    end
end
