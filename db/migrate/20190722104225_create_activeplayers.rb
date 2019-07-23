class CreateActiveplayers < ActiveRecord::Migration[5.2]
  def change
    create_table :activeplayers do |t|
      t.string :active_player

      t.timestamps
    end
  end
end
