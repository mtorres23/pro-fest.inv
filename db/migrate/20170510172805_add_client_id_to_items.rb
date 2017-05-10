class AddClientIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :client_id, :integer
  end
end
