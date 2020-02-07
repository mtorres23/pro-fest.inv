class RemoveLocationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :location_id
  end
end
