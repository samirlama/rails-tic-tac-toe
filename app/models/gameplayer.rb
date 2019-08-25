class Gameplayer < ApplicationRecord
    belongs_to :game
    belongs_to :player
    enum status: [:waiting , :playing]
    def self.sort_by(sort_by_order)
        result = self.where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name")
        if(sort_by_order == "name_asc")
            result = result.order("name asc")
        end 
        if(sort_by_order == "name_desc")
            result = result.order("name desc")
        end
        if(sort_by_order == "win_desc")
            result = result.order("win desc")
        end 
        if(sort_by_order == "win_asc")
            result = result.order("win asc")
        end
        result
    end
    
    scope :game_now -> { where(game_id: current_game.id) }
     
end
