class RemoveBinIdFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_reference :transactions, :bin, index: true, foreign_key: true
  end
end
