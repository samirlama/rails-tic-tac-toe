module ApplicationHelper
    def current_game
        if !session[:game].blank?
           return Game.find(session[:game])
        end
    end
    def player(name)
        @player = Player.find(name)
        return @player.username
    end
    def player_count(player)
        @player = Gameplayer.all.where(game_status: "win" )
        @player_count = @player.where(player_id: player).count
        return @player_count
    end
end
