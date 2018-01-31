json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  json.chef recipe.user.name
  json.ingredients recipe.ingredients_list
  json.prep_time recipe.friendly_prep_time
  json.directions recipe.directions_list
end