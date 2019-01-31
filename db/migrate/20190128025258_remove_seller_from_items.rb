class RemoveSellerFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :seller, :integer
  end
end
