class AddMoreDetailsToApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :laundry_in_unit, :integer
    add_column :apartments, :laundry_in_unit, :boolean
  end
end
