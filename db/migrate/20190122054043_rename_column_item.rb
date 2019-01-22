class RenameColumnItem < ActiveRecord::Migration[5.1]
  def change
    add_column    :items, :delivery_method, :integer, null:false

  end
end
