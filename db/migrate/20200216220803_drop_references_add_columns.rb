class DropReferencesAddColumns < ActiveRecord::Migration[5.0]
  def change
    remove_reference :messages, :item
    remove_reference :messages, :transaction
    add_column :messages, :item_id, :integer
    add_column :messages, :transaction_id, :integer
  end
end
