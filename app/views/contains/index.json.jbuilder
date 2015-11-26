json.array!(@contains) do |contain|
  json.extract! contain, :id, :recipe_id, :ingredient_id, :amount, :unit
  json.url contain_url(contain, format: :json)
end
