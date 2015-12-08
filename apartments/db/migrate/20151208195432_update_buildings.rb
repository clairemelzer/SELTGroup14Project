class UpdateBuildings < ActiveRecord::Migration
  def change
    remove_column :buildings, :parking, :string
    add_column :buildings, :parking, :boolean
    remove_column :buildings, :pets, :string
    add_column :buildings, :pets, :boolean
  end
end
