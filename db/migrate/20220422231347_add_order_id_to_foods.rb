class AddOrderIdToFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :order_id
  end
end
