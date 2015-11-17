class AddDetailsToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :pets, :string #cats, dogs, none
    add_column :buildings, :laundry, :integer #number of washing/dryer machines
    add_column :buildings, :parking, :string #garage, onstreet, paid for?
    add_column :buildings, :number_apartments, :integer #number of apartments building holds
    #add_column :buildings, :average_rating, :integer #some scale of rating? need to implement within views
  end
end
