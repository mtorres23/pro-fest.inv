class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :address
      t.float :latitude
      t.float :longitude
      t.string :admin_id
      t.integer :prev_year_event_id

      t.timestamps
    end
  end
end
