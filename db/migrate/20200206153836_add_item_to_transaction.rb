class AddItemToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :item
  end
end
