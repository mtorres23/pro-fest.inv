class DropClients < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :client
    remove_reference :users, :client
    drop_table :clients
  end
end
