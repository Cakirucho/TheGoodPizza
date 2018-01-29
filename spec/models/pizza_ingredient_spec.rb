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

require 'rails_helper'

RSpec.describe PizzaIngredient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
