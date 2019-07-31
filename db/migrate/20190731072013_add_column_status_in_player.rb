class AddColumnStatusInPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players , :status , :boolean , default: true
  end
end
