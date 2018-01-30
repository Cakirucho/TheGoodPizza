# == Schema Information
#
# Table name: pizza_ingredients
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  pizza_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PizzaIngredient < ApplicationRecord

  belongs_to :ingredient, foreign_key: "ingredient_id"

  def ingredient_name
    self.ingredient.name
  end

  def ingredient_price
    self.ingredient.get_price
  end
end
