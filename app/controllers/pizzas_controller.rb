class PizzasController < ApplicationController

  CHECKBOX_SELECTED = "on"

  def show
  end

  def new
    @pizza = Pizza.new
    @ingredients = Ingredient.all
  end

  def create
    @new_pizza = Pizza.new(pizza_params)

    if @new_pizza.present? && @new_pizza.save
      add_ingredients
      redirect_to homepage_path and return
    end

    # TODO -> Show error.
    redirect_to new_ingredient_path
  end

  private

  def pizza_params
    params.require(:pizza).permit(:name)
  end

  # TODO -> Maybe this method should be in a service that will manage
  #         the addition of ingredients.
  def add_ingredients
    ingredients_selected = params[:ingredients]
    ingredients_selected.each do |ingredient_id, selected|
      new_pizza_ingredient = PizzaIngredient.new

      if selected == CHECKBOX_SELECTED
        last_pizza = Pizza.last

        new_pizza_ingredient.ingredient_id = ingredient_id.to_i
        new_pizza_ingredient.pizza_id = last_pizza.id
      end

      new_pizza_ingredient.save
    end
  end
end
