class AddCustomerToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :customer
  end
end
