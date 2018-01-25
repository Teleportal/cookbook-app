class RecipesController < ApplicationController
  def index
    search_term = params[:search]

    recipes = Recipe.all

    if search_term
      recipes = recipes.where("title iLike ? OR ingredients iLike ?", "%#{search_term}%", "%#{search_term}%")
    end

    sort_attribute = params[:sort]

    if sort_attribute
      recipes = recipes.order[sort_attribute]
    end

    render json: recipes.as_json
  end

  def create
    recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )
    recipe.save
    render json: recipe.as_json
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe.as_json
  end

  def update
    recipe = Recipe.find(params[:id])

    recipe.title = params[:title] || recipe.title
    recipe.chef = params[:chef] || recipe.chef
    recipe.ingredients = params[:ingredients] || recipe.ingredients
    recipe.directions = params[:directions] || recipe.directions
    recipe.save

    render json: recipe.as_json
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully destroyed Recipe ##{recipe.id}."}
  end

end
