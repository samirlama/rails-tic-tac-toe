class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.integer :data
      t.references :game , foreign_key: true
      t.references :player , foreign_key: true
      t.timestamps
    end
  end
end
