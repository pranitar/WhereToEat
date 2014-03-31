class AddPaymentTypesToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :accepts_dinex, :boolean
  	add_column :restaurants, :accepts_cash, :boolean
  	add_column :restaurants, :accepts_credit, :boolean
  	add_column :restaurants, :accepts_plaid_cash, :boolean
  end
end
