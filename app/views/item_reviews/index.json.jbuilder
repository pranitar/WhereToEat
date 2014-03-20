json.array!(@item_reviews) do |item_review|
  json.extract! item_review, :id, :restaurant_id, :user_id, :item_id, :review, :rating, :date
  json.url item_review_url(item_review, format: :json)
end
