class AddDefaultLocationToUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :event_id
  	change_column :users, :location_id, :integer, :default => 2
  end
end
