class AddDueDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :due_date, :datetime
    add_column :orders, :status, :string
  end
end
