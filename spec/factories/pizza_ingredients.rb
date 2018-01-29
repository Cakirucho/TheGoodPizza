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

FactoryBot.define do
  factory :pizza_ingredient do
    ingredient_id 1
    pizza_id 1
  end
end
