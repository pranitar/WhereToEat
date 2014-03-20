json.array!(@menus) do |menu|
  json.extract! menu, :id, :restaurant_id, :name
  json.url menu_url(menu, format: :json)
end
