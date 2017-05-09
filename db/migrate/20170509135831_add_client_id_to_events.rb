class AddClientIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :client_id, :integer
  end
end
