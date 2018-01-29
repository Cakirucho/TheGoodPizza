class CreatePizzaIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :pizza_ingredients do |t|
      t.integer :ingredient_id
      t.integer :pizza_id

      t.timestamps
    end
  end
end
