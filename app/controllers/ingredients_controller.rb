class IngredientsController < ApplicationController
  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect_to ingredients_path, notice: 'Ingredient was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /ingredients/1
  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update_attributes(params[:ingredient])
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end
end
