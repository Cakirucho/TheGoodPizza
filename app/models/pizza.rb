# == Schema Information
#
# Table name: pizzas
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  selling_price :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Pizza < ApplicationRecord

  has_many :pizza_ingredients, dependent: :destroy

  def total_price
    ingredients_total_price = 0
    ingredients = self.pizza_ingredients

    ingredients.each do |ingredient|
      ingredients_total_price += ingredient.ingredient_price
    end

    half_total = ingredients_total_price / 2
    # Total price will be the sum of all products +
    # half of that product (work time).
    pizza_price = half_total + ingredients_total_price
    return pizza_price
  end
end
