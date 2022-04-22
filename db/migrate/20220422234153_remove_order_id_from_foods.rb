class RemoveOrderIdFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :order_id, :integer
  end
end
