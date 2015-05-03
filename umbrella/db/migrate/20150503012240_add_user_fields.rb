class AddUserFields < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :address_city, :string
    add_column :users, :address_state, :string
    add_column :users, :address_zipcode, :integer
    add_column :users, :phone_number, :string
  end
  
  def self.down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :address_1, :string
    remove_column :users, :address_2, :string
    remove_column :users, :address_city, :string
    remove_column :users, :address_state, :string
    remove_column :users, :address_zipcode, :integer
    remove_column :users, :phone_number, :string
  end
end
