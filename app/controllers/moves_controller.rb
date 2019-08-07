class MovesController < ApplicationController
    
    include ApplicationHelper
    def index
            # @moves = Move.where("player_id=? OR player_id = ?",session[:player1] , session[:player2])
            @moves = current_game.moves.all
            @recent_gameplayers = Gameplayer.where(game_id: current_game.id)
            @player1_id = @recent_gameplayers.first.player_id

            @player2_id = @recent_gameplayers.last.player_id
            
            @player1 = Player.find(@player1_id)
            @player2 = Player.find(@player2_id)
            # @player1 = Player.find(session[:player1])
            # @player2 = Player.find(session[:player2])
           
           @move_count = current_game.moves.count
           if @move_count % 2 == 0
                session[:active_player] = @player1_id
           else
                session[:active_player] = @player2_id
           end
           @active_player = Player.find(session[:active_player])    
            respond_to do |format|
                format.html {}
                format.json {render json: {all_data: {move: @moves , active_player: @active_player.username , player1: @player1.username , player2: @player2.username} } }
            end
    end
    def create
        @move = current_game.moves.new(move_params)
        @check_moves = current_game.moves.find_by(step: move_params[:step])
        if @check_moves.nil?
            @move.save  
        end
    end
    
    # def toggle_session
    #     
    # end

    private
    def move_params
        params.require(:move).permit(:step).merge(player_id: session[:active_player])
    end
end
