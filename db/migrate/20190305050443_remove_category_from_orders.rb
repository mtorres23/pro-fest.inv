class RemoveCategoryFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :category_id, :integer
  end
end
