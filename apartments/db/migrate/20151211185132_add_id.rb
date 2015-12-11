class AddId < ActiveRecord::Migration
  def change
    add_foreign_key :apartments, :user_id
  end
end
