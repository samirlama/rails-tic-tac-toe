class Player < ApplicationRecord
    has_many :gameplayers , dependent: :destroy
    has_many :games , through: :gameplayers
    has_many :moves , dependent: :destroy
    validates :username , presence: true 
    
end
