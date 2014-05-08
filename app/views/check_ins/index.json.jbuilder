json.array!(@check_ins) do |check_in|
  json.extract! check_in, :id, :restaurant_id, :user_id, :time, :comment
  json.url check_in_url(check_in, format: :json)
end
