module HomepageControllerHelper

  def pizza_formatted_price(total_price)
    return "Price: " + total_price.to_s + "€"
  end

  def formatted_ingredient(ingredient)
    return "- " + ingredient.ingredient_name + ingredient.ingredient_price.to_s + "€"
  end
end
