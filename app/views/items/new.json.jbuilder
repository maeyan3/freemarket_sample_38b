json.array! @categories do |category|
  json.id   category.id
  json.name category.category_name
end
