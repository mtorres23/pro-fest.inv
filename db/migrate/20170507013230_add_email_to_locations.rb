class AddEmailToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :email, :string
  end
end
