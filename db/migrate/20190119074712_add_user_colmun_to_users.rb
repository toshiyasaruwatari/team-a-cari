class AddUserColmunToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :icon, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_reading, :string
    add_column :users, :last_reading, :string
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :building_name, :string
    add_column :users, :address, :text
    add_column :users, :birth_day, :date
    add_column :users, :birth_month, :date
    add_column :users, :birth_year, :date
    add_column :users, :point, :integer
    add_column :users, :proseed, :integer
  end
end
