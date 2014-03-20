class Restaurant < ActiveRecord::Base

	#Associations
	has_many :restaurant_reviews
	has_many :menus
	has_many :items

	#Validations
	validates_presence_of :name, :address, :zip_code, :cuisine, :area
	validates_numericality_of :zip_code, :only_integer => true

	#Scopes
	scope :on_campus, -> {where(area: 'CMU')}

end
