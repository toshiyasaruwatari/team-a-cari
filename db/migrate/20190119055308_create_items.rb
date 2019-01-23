class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string         :name, null:false
      t.integer        :price, null:false
      t.text           :describe, null:false
      t.integer        :status, null:false
      t.integer        :burden, nul:false
      t.integer        :delivery_method, null:false
      t.integer        :prefecture, null:false
      t.integer        :delivery_day, null:false
      t.integer        :seller_id, null:false
      t.integer        :buyer_id, null:true
      t.timestamps
    end
  end
end
