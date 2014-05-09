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
	scope :by_name, -> {order(:name)}
	scope :on_campus, -> {where(area: 'CMU')}
	scope :off_campus, -> {where(area: 'Craig')}
  scope :by_price, -> {order(:price)}
  scope :by_rating, -> {order(:rating)}
  scope :by_waiting_time, -> {order(:waiting_time)}

	#Geocoding
	geocoded_by :address

	def self.generate_list(lat, long)
		restaurants = {
			'alphabetical' => by_name,
			'CMU' => on_campus,
			'Craig' => off_campus,
			'price' => by_price,
			'wait' => by_waiting_time,
			#'rating' => by_rating
			'by_distance' => by_distance(lat, long)
		}
	end

  #Filter by distance
  def self.by_distance(lat, long)
		puts self.inspect
		Restaurant.all.sort {|a,b| a.distance(lat,long) <=> b.distance(lat,long)}
    #Restaurant.order(self.distance(lat,long))
  end

  def distance(lat, long)
    Geocoder::Calculations.distance_between([lat,long], [latitude,longitude])
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
    business_hour = self.business_hours.where("day = ?", Time.now.strftime("%A")).first
    puts business_hour
    #now see if current time is in between open at and closed at
    open_at_today = Time.now.change({:hour => business_hour.open_at.hour , :min => business_hour.open_at.hour})
    closed_at_today = Time.now.change({:hour => business_hour.closed_at.hour , :min => business_hour.closed_at.hour})
    return open_at_today < Time.now && Time.now < closed_at_today
  end

  def add_business_hour(open_at, close_at, day)
    if (0..6).to_a.include?(day)
      puts 'hi'
    end
  end

  def get_checked_in_users
    User.where(:location => self.id)
  end
end
