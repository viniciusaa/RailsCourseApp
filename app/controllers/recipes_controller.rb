class RecipesController < ApplicationController
  before_action :select_recipe, except: [:new, :create, :index]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe was successfully created"
      redirect_to recipe_path(@recipe)
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was successfully updated"
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def show; end

  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe.destroy
    flash[:danger] = "Recipe was successfully deleted"
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def select_recipe
    @recipe = Recipe.find(params[:id])
  end
end
