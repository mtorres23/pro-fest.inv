class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :url
      t.string :collection
      t.integer :event_id
      t.integer :location_id
      t.integer :account_id

      t.timestamps
    end
  end
end
