class ChangePrimaryKeysToBigIntForAllTables < ActiveRecord::Migration[5.0]
  def change
    change_column :bins, :id, :bigint, unique: true, null: false, auto_increment: true
    change_column :clients, :id, :bigint, unique: true, null: false, auto_increment: true
    change_column :events, :id, :bigint, unique: true, null: false, auto_increment: true
    change_column :locations, :id, :bigint, unique: true, null: false, auto_increment: true
    change_column :orders, :id, :bigint, unique: true, null: false, auto_increment: true
    change_column :transactions, :id, :bigint, unique: true, null: false, auto_increment: true
    
  end
end
