class AddAdminIdToLocations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :locations, :admin_id
    add_column :locations, :admin_id, :integer
  end
end
