class ChangeItemToNewSchema < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :location
    add_reference :items, :product
    add_column :items, :category, :string
    add_column :items, :quantity, :integer
    remove_column :items, :title
    remove_column :items, :upc
    remove_column :items, :description
    remove_column :items, :color
    remove_column :items, :size
    remove_column :items, :dimension
    remove_column :items, :weight
    remove_column :items, :lowest_recorded_price
    remove_column :items, :images
    remove_column :items, :unit
  end
end
