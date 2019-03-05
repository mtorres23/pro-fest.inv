class CreateBins < ActiveRecord::Migration[5.0]
  def change
    create_table :bins do |t|
      t.references :item, foreign_key: true
      t.integer :qty
      t.datetime :last_updated
      t.integer :last_order
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
