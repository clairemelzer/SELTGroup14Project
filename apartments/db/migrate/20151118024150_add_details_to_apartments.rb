class AddDetailsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :laundry, :string
  end
end
