class RenameSellerIdToSellerItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :seller_id, :seller
  end
end
