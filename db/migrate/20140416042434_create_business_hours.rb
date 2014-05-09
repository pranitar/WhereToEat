class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.time :open_at
      t.time :closed_at
      t.string :day
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
