class ChangeTypeToMessageType < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :type
    add_column :messages, :message_type, :string
  end
end
