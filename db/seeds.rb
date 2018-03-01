User.create!([
  {name: "bob", email: "bob@thebuilder.com", password: "password", password_confirmation: "password"},
  {name: "Cassie", email: "triannakumira@gmail.com", password: "password", password_confirmation: "password"},
  {name: "Josh", email: "josh@gmail.com", password: "password", password_confirmation: "password"},
  {name: "Cool J", email: "coolj2@gmail.com", password: "password", password_confirmation: "password"}
])
Recipe.create!([
  {title: "Hand Sandwich", chef: "Josh", ingredients: "left hand, right hand, lettuce, pickle, and onion", directions: "place lettuce, pickle and onion on left hand, put your hands together, Wisconsin", image_url: nil, prep_time: 100, user_id: 1},
  {title: "Egg", chef: "Josh", ingredients: "One live chicken", directions: "grasp chicken firmly, squeeze... gently", image_url: nil, prep_time: 2, user_id: 1},
  {title: "ice cubes", chef: "Beaker", ingredients: "water", directions: "freeze the water", image_url: nil, prep_time: 61, user_id: 1}
])
Category.create!([
  {name: "Cheap"},
  {name: "Junk Food"},
  {name: "Edible"}
])
CategoryRecipe.create!([
  {category_id: 1, recipe_id: 1},
  {category_id: 1, recipe_id: 4},
  {category_id: 2, recipe_id: 2},
  {category_id: 3, recipe_id: 1},
  {category_id: 3, recipe_id: 4}
])
