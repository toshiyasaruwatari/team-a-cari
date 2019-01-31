class RemoveBuyerIdFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :buyer_id, :integer
  end
end
