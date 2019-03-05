class RemovePlacesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :places
  end
end
