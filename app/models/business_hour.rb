class BusinessHour < ActiveRecord::Base
  belongs_to :restaurant

  Days = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday']

end
