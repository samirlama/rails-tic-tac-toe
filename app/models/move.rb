class Move < ApplicationRecord
    belongs_to :player
    belongs_to :game
    # after_create_commit :find_active_player

    # def find_active_player
    #     Player.find(session[:active_player])
    # end

end
