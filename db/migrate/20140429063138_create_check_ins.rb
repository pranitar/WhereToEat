class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.references :restaurant, index: true
      t.references :user, index: true
      t.datetime :time
      t.string :comment

      t.timestamps
    end
  end
end
