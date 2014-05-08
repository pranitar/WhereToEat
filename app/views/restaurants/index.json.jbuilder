json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :zip_code, :cuisine, :area, :longitude, :latitude
  json.url restaurant_url(restaurant, format: :json)
end
