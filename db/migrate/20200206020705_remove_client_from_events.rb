class RemoveClientFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_reference :events, :client
  end
end
