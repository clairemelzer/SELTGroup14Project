class UpdateApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :apartment_number, :integer
    add_column :apartments, :apartment_number, :string
    remove_column :apartments, :bedrooms, :integer
    add_column :apartments, :bedrooms, :string
    remove_column :apartments, :bathrooms, :integer
    add_column :apartments, :bathrooms, :string
    remove_column :apartments, :rent, :integer
    add_column :apartments, :rent, :string
    remove_column :apartments, :monthly_util, :integer
    add_column :apartments, :monthly_util, :string
  end
end
