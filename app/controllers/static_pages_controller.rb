class StaticPagesController < ApplicationController
    def index   
        @distinct_game_player = Gameplayer.where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name")
        unless params[:search].nil?
            @distinct_game_player = Gameplayer.where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name").where('username LIKE ?' , "%#{search}%")
        end
        unless params[:sort].nil?
            @distinct_game_player = Gameplayer.sort_by(params[:sort])
        end

        respond_to do |format|
            format.html {}
            format.js {}
        end
    end
end

