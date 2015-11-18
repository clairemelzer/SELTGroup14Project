class AddDetailsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :monthly_util, :integer
    add_column :apartments, :central_air, :boolean
    add_column :apartments, :balcony, :boolean
  end
end
