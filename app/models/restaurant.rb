class Restaurant < ActiveRecord::Base

	after_validation :geocode, if: ->(obj){ obj.address.present?}

	#Associations
	has_many :restaurant_reviews
	has_many :menus
	has_many :items
  has_many :business_hours

	#Validations
	validates_presence_of :name, :street, :city, :state, :zip_code, :cuisine, :area
	validates_format_of :zip_code, :with => /^\d{5}(?:[-\s]\d{4})?$/, :message => "should be in the form 12345 or 12345-1234", :multiline => true

	#Scopes
	scope :on_campus, -> {where(area: 'CMU')}

	#Geocoding
	geocoded_by :address

	def address 
		[street, city, state, zip_code].compact.join(', ')
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
