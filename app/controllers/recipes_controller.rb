class RecipesController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    search_term = params[:search]

    @recipes = Recipe.all

    if search_term
      @recipes = @recipes.where("title iLike ? OR ingredients iLike ?", "%#{search_term}%", "%#{search_term}%")
    end

    sort_attribute = params[:sort]

    if sort_attribute
      @recipes = @recipes.order[sort_attribute]
    end

    render 'index.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                        title: params[:title],
                        user_id: current_user.id,
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )
    @recipe.save
    render 'show.json.jbuilder'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    if @recipe.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @recipe.errors.full_messages }, status: :unprocessable_entity
      puts @recipe.errors.full_messages
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully destroyed Recipe ##{recipe.id}."}
  end

end
