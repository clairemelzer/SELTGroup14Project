class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :building_id
      t.integer :apartment_number
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :rent
      t.integer :laundry_in_unit
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
