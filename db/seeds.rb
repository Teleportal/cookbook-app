Category.create(name: "Cheap")
Category.create(name: "Junk Food")
Category.create(name: "Edible")

CategoryRecipe.create!([
                        {category_id: 1, recipe_id: 1},
                        {category_id: 1, recipe_id: 4},
                        {category_id: 2, recipe_id: 2},
                        {category_id: 3, recipe_id: 1},
                        {category_id: 3, recipe_id: 4}
                      ])