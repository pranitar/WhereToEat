class Restaurant < ActiveRecord::Base

	#Associations
	has_many :restaurant_reviews
	has_many :menus
	has_many :items

	#Validations
	validates_presence_of :name, :address, :zip_code, :cuisine, :area
	validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"

	#Scopes
	scope :on_campus, -> {where(area: 'CMU')}

end
