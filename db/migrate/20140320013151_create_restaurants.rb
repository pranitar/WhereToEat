class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :cuisine
      t.string :area
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
