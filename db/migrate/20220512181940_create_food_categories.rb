class CreateFoodCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :food_categories do |t|
      t.integer :food_id
      t.integer :category_id

      t.timestamps
    end
  end
end
