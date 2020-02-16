class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :type
      t.string :text
      t.integer :min_access_level
      t.integer :created_by
      t.references :location, foreign_key: true
      t.references :order, foreign_key: true
      t.references :event, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
