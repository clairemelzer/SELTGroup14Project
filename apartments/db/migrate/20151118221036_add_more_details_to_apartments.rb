class AddMoreDetailsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :laundry_in_unit, :boolean
  end
end
