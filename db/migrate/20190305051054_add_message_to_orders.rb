class AddMessageToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :message, :text
  end
end
