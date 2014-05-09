class CreateItemReviews < ActiveRecord::Migration
  def change
    create_table :item_reviews do |t|
      t.references :restaurant, index: true
      t.references :user, index: true
      t.references :item, index: true
      t.string :review
      t.integer :rating
      t.datetime :date

      t.timestamps
    end
  end
end
