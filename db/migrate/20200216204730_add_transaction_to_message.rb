class AddTransactionToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :transaction
  end
end
