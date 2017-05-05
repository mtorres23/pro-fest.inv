class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :upc
      t.text :description
      t.string :color
      t.string :size
      t.string :dimension
      t.string :weight
      t.float :sale_price
      t.float :lowest_recorded_price
      t.string :images

      t.timestamps
    end
  end
end
