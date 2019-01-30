class AddColumnTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_id, :text
    add_column :users, :pay_id, :text
  end
end
