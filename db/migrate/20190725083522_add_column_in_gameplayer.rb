class AddColumnInGameplayer < ActiveRecord::Migration[5.2]
  def change
    add_column :gameplayers , :game_status , :string
  end
end
