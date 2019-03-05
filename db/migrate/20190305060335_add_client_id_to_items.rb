class AddClientIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :client, foreign_key: true
  end
end
