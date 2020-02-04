class AddAccountIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :account, foreign_key: true
  end
end
