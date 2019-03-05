class RemoveContentAndOriginIdAndDestinationIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :content, :text
    remove_column :orders, :origin_id, :integer
    remove_column :orders, :destination_id, :integer
  end
end
