class PizzaIngredientsController < ApplicationController

  def destroy
    pizza_ingredient = PizzaIngredient.find(params[:id])
    pizza_id = pizza_ingredient.pizza_id

    if pizza_ingredient.destroy
      flash[:notice] = "Ingredient deleted"
    end

    pizza = Pizza.find(pizza_id)
    redirect_to pizza_path(pizza)
  end
end
