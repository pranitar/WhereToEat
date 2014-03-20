class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :zip_code
      t.string :cuisine
      t.string :area
      t.hash :hours
      t.[] :coordinates

      t.timestamps
    end
  end
end
