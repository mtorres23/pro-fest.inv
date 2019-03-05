class AddQtyToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :qty, :integer
  end
end
