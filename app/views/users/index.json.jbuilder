json.array!(@users) do |user|
  json.extract! user, :id, :name, :age, :location
  json.url user_url(user, format: :json)
end
