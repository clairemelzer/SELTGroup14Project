class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.integer :building_id
      t.integer :user_id
      t.integer :apartment_number

      t.timestamps null: false
    end
  end
end
