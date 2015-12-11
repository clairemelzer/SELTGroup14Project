class AddApartmentIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :apartment_id, :integer
  end
end
