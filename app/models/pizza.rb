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
end
