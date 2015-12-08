class AddCity < ActiveRecord::Migration
  def change
    add_column :buildings, :city, :string
  end
end
