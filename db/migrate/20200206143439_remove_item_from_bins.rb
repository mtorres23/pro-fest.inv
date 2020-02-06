class RemoveItemFromBins < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bins, :item
    remove_reference :transactions, :item
  end
end
