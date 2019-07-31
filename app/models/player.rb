class Player < ApplicationRecord
    has_many :gameplayers , dependent: :destroy
    has_many :games , through: :gameplayers
    has_many :moves , dependent: :destroy
    validates :username , presence: true 
    
   
    # def sort_by(sort_by_order)
    #     if(sort_by_order == "name_asc")
    #         where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(id) as win, Max(players.username) as name").order("name asc")
  
    #     end
    
    
    #     if(sort_by_order == "name_desc")
    #        where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name").order("name desc")
    #     end
    
    
    #     if(sort_by_order == "win_desc")
    #       where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name").order("win desc")
    #     end
        
    #     if(sort_by_order == "win_asc")
    #        where(game_status: 'win').joins(:player).group(:player_id).select("player_id, count(gameplayers.id) as win, Max(players.username) as name").order("win asc")
    #     end
    # end

    
end
