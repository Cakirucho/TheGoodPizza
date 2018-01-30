class RemoveSellingPriceFromPizzas < ActiveRecord::Migration[5.1]
  def change
    remove_column :pizzas, :selling_price, :integer
  end
end
