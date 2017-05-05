class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :content
      t.integer :created_by
      t.integer :verified_by
      t.datetime :delivery_date
      t.float :total_price
      t.integer :total_amount
      t.integer :category_id
      t.string :type
      t.integer :origin_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
