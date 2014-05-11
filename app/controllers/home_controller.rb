class HomeController < ApplicationController

  def index
  	@restaurants = Restaurant.generate_list(current_user.latitude, current_user.longitude)
    @check_ins = CheckIn.all
  	puts @restaurants.inspect
  	render "home/index"
  end

  def filter
  	if params[:filter] == 'price'
  		puts 'price'
  		@restaurants = Restaurant.by_price
  		puts @restaurants
  	elsif params[:filter] == 'distance'
  		puts 'distance'
  		@restaurants = Restaurant.by_distance(params[:latitude], params[:longitude])
  	elsif params[:filter] == 'waiting_time'
  		puts 'waiting_time'
  		@restaurants = Restaurant.by_waiting_time
  	elsif params[:filter] == 'rating'
  		puts 'rating'
  		@restaurants = Restaurant.by_rating
  	end
	respond_to do |format|
		format.json {render json: @restaurants.map {|r| r.to_json}}
	end
  end
end
