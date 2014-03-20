class CreateRestaurantReviews < ActiveRecord::Migration
  def change
    create_table :restaurant_reviews do |t|
      t.references :restaurant, index: true
      t.references :user, index: true
      t.string :review
      t.integer :rating
      t.datetime :date

      t.timestamps
    end
  end
end
