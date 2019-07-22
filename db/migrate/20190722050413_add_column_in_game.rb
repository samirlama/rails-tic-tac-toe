class AddColumnInGame < ActiveRecord::Migration[5.2]
  def change
    add_column :gameplayers , :status ,:integer , default: 0
  end
end
