class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :origin_id
      t.integer :dest_id
      t.string :status
      t.references :bin, foreign_key: true

      t.timestamps
    end
  end
end
