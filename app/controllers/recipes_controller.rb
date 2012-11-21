class RecipesController < ApplicationController
  before_filter :find_recipe, :only => [ :show, :edit, :update ]

  def index
    if ! params[:search].blank? then
      @recipes = Recipe.where(Recipe.arel_table[:name].matches("%#{params[:search]}%"))
      @description = "Rezepte mit '#{params[:search]}' im Namen"
    elsif ! params[:wanted_ingredient_ids].nil? and ! params[:wanted_ingredient_ids].empty? then
      @recipes = Recipe.find_by_ingredients( params[:wanted_ingredient_ids] )
      ingredients = Ingredient.find( params[:wanted_ingredient_ids] ).map(&:name)
      @description = "Rezepte die #{ingredients.join(' und ')} enthalten"
    else
      @recipes = Recipe.all
      @desicription = "Alle Rezepte"
    end

  end

  def search
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url
  end

private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
