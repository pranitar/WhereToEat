class ItemReview < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  belongs_to :item
end
