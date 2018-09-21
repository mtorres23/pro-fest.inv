class AddTypeToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :type, :string
  end
end
