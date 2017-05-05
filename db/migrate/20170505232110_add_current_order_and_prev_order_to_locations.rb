class AddCurrentOrderAndPrevOrderToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :current_order_id, :integer
    add_column :locations, :prev_order_id, :integer
  end
end
