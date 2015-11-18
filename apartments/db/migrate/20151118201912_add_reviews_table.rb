class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comments
      t.integer :rating
      t.string :user_name
      t.integer :apartment_id
    end
  end
end
