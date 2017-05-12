class AddRoleToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :role, :string
    remove_column :orders, :type, :string
  end
end
