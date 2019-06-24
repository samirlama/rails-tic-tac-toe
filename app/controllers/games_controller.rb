class GamesController < ApplicationController
    def index
        @moves = Game.where("player_id = ? OR player_id = ?", session[:player1], session[:player2])
        respond_to do |format|
            format.html 
            format.json {render json: @moves}
        end
    end
    def create
        @moves = Game.new(move: params[:move] , player_id: session[:active_user])
        # binding.pry
         if Game.where(move: params[:move]).empty?
            @moves.save!
            
            @all_moves = Game.where("player_id = ? OR player_id = ?",session[:player1], session[:player2])
            if @all_moves.count % 2 != 0
                session[:active_user] = session[:player1]
            else
                session[:active_user] = session[:player2]
            end 
            
       else
            flash[:success] = "Moves already Used"
           
       end
       redirect_to "/games"

      
    end

end
