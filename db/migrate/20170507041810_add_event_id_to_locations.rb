class AddEventIdToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :event_id, :integer
  end
end
