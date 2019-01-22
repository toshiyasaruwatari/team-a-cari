class AddItemColumnToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :category , null:false, foreign_key: true
    add_reference :items, :brand , null:false, foreign_key: true
    add_reference :items, :size , null:false, foreign_key: true
  end
end
