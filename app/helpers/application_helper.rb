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
end
