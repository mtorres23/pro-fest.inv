class AddAccessCodeToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :access_code, :string
  end
end
