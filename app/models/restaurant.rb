class Restaurant < ActiveRecord::Base

	after_validation :geocode, if: ->(obj){ obj.address.present?}

  has_many :business_hours
  accepts_nested_attributes_for :business_hours

	#Associations
	has_many :restaurant_reviews
	has_many :menus
	has_many :items


	#Validations
	validates_presence_of :name, :street, :city, :state, :zip_code, :cuisine, :area
	validates_format_of :zip_code, :with => /^\d{5}(?:[-\s]\d{4})?$/, :message => "should be in the form 12345 or 12345-1234", :multiline => true

	#Scopes
	scope :on_campus, -> {where(area: 'CMU')}
  scope :by_price, -> {order(:price)}
  scope :by_rating, -> {order(:rating)}
  scope :by_waiting_time, -> {order(:waiting_time)}

	#Geocoding
	geocoded_by :address

  #Filter by distance
  def by_distance(lat, long)
    Restaurant.order(Geocoder::calculations.distance_between([lat,long], [latitude,longitude]))
  end

	def address 
		#[street, city, state, zip_code].compact.join(', ')
    [street].compact.join(', ')
	end 

  def create_map_link(zoom=12,width=800,height=800)
  	markers = ""; i = 1
  	markers += "&markers=color:red%7Ccolor:red%7Clabel:#{i}%7C#{self.latitude},#{self.longitude}"
  	map = "http://maps.google.com/maps/api/staticmap?center= #{latitude},#{longitude}&zoom=16&size=400x400&maptype=roadmap#{markers}&sensor=false"
  end

	#Areas
	def self.areas
		['CMU', 'Craig Street']
	end 

  def is_open?
    self.business_hours.where("open_at < ? and closed_at > ? and day = ?", Time.now.seconds_since_midnight, Time.now.seconds_since_midnight, Time.now.strftime("%A"))
  end

  def add_business_hour(open_at, close_at, day)
    if (0..6).to_a.include?(day)
      puts 'hi'
    end
  end
end
