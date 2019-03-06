class ChangePrimaryKeyToBigintOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :id, :bigint, unique: true, null: false, auto_increment: true
  end
end
