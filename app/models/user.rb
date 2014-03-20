class User < ActiveRecord::Base

	#Associations
	has_many :restaurant_reviews
	has_many :item_reviews

	#Validations
	validates_presence_of :name, message: "Cannot be blank"


end
