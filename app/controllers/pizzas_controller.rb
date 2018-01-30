class PizzasController < ApplicationController

  CHECKBOX_SELECTED = "on"

  def show
    @pizza = Pizza.find(params[:id])
    @non_added_ingredients = get_non_added_ingredients(@pizza)
  end

  def new
    @pizza = Pizza.new
    @ingredients = Ingredient.all
  end

  def create
    @new_pizza = Pizza.new(pizza_params)

    if @new_pizza.present? && @new_pizza.save
      add_ingredients

      flash[:notice] = "Pizza created"
      redirect_to homepage_path and return
    end

    redirect_to new_ingredient_path
  end

  def update
    new_pizza_ingredient = PizzaIngredient.new

    new_pizza_ingredient.ingredient_id = params[:ingredient_id]
    new_pizza_ingredient.pizza_id = params[:id]

    if new_pizza_ingredient.save
      flash[:notice] = "Ingredient added"
    end

    pizza = Pizza.find(params[:id])
    redirect_to pizza_path(pizza)
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

  def get_non_added_ingredients(pizza)
    added_ingredients = pizza.pizza_ingredients
    added_ingredients_ids = []
    added_ingredients.each do |ingredient|
      added_ingredients_ids.push(ingredient.ingredient_id)
    end

    non_added_ingredients = Ingredient.where.not(id: added_ingredients_ids)
    return non_added_ingredients
  end
end
