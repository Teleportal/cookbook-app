json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.chef recipe.chef
  json.ingredients recipe.ingredients
  json.formatted_ingredients recipe.ingredients_list
  json.prep_time recipe.prep_time
  json.formatted_prep_time recipe.friendly_prep_time
  json.directions recipe.directions
  json.formatted_direction recipe.directions_list
  json.image_url recipe.image_url
end