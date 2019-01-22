class ChangeColumnToItem < ActiveRecord::Migration[5.1]
  def up
    change_column :items, :buyer_id, :integer, null: true
  end

  def down
    change_column :items, :buyer_id, :integer, null: false
  end
end
