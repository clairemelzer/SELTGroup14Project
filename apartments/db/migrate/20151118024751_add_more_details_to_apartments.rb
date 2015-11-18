class AddMoreDetailsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :review, :string
  end
end
