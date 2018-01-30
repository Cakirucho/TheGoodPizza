# == Schema Information
#
# Table name: pizzas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :pizza do
    name "MyString"
    selling_price 1
  end
end
