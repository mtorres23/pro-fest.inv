class AddClientIdAndEventIdToUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :client_id, :integer
    remove_column :users, :event_id, :integer
    add_column :users, :client_id, :integer
    add_column :users, :event_id, :integer
  end
end
