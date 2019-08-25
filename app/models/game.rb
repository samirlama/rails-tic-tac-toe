class Game < ApplicationRecord
    has_many :gameplayers , dependent: :destroy
    has_many :players , through: :gameplayers
    has_many :moves , dependent: :destroy

    scope :game_now -> { where(game_id: current_game.id) }
end
