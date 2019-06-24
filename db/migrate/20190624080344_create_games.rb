class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :move
      t.integer :player_id
      t.timestamps
    end
  end
end
