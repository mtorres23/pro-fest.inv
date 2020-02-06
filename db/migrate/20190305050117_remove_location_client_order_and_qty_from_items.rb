class RemoveLocationClientOrderAndQtyFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :order_id, :integer
    remove_column :items, :qty, :integer
    remove_column :items, :location_id, :integer
  end
end
