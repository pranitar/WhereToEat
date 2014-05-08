json.array!(@restaurant_reviews) do |restaurant_review|
  json.extract! restaurant_review, :id, :restaurant_id, :user_id, :review, :rating, :date
  json.url restaurant_review_url(restaurant_review, format: :json)
end
