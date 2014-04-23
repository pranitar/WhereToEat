class AddWaitingTimeToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :waiting_time, :integer
  end
end
