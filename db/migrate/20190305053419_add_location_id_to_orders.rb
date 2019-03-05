class AddLocationIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :location, foreign_key: true
  end
end
