class ChangeDatatypeImageOfItemImages < ActiveRecord::Migration[5.1]
  def change
    change_column :item_images, :image, :string
  end
end
