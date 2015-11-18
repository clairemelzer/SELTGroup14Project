class AddEvenMoreDetailsToApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :laundry_in_unit, :string
    add_column :apartments, :laundry_in_unit, :boolean
  end
end
