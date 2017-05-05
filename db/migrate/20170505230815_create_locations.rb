class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :title
      t.text :address
      t.float :latitude
      t.float :longitude
      t.string :admin_id

      t.timestamps
    end
  end
end
