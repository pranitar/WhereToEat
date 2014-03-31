class HomeController < ApplicationController
  
  def index
  	@restaurants = Restaurant.all
  	render "home/index"
  end
end