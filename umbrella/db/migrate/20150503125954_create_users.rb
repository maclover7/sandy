class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :address_city
      t.string :address_state
      t.integer :address_zipcode
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
