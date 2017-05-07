class AddClientIdAndAdminIdToEvents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :admin_id
    add_column :events, :client_id, :integer
    add_column :events, :admin_id, :integer
  end
end
