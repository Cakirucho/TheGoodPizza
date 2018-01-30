class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @new_ingredient = Ingredient.new(ingredient_params)

    if @new_ingredient.present? && @new_ingredient.save
      flash[:notice] = "Ingredient created"
      redirect_to homepage_path and return
    end

    redirect_to new_ingredient_url
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :price)
  end
end
