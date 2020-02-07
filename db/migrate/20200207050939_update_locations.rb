class UpdateLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :event_id
    remove_column :locations, :email
    remove_column :locations, :admin_id
    remove_column :locations, :current_order_id
    remove_column :locations, :prev_order_id
    add_reference :locations, :event

  end
end
