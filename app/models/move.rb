class Move < ApplicationRecord
    belongs_to :player
    belongs_to :game
    
    scope :new_game_now -> { where(game_id: current_game) }
end
