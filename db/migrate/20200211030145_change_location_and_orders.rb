class ChangeLocationAndOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :hidden, :boolean
    add_column :orders, :assigned_to, :integer
    add_column :orders, :last_updated_by, :integer
    add_column :transactions, :delivered_by, :integer
  end
end
