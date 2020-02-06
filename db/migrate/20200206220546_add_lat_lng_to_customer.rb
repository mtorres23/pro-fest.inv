class AddLatLngToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :latitude, :float
    add_column :customers, :longitude, :float
  end
end
