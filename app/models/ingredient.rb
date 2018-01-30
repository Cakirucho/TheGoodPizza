# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord

  before_save { |ingredient| ingredient.price = price_cents }

  def price_cents
    price = self.price
    if price.present?
      return price * 100
    end
  end

  def get_price
    self.price / 100
  end
end
