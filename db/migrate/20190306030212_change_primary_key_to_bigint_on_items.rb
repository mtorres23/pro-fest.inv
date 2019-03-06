class ChangePrimaryKeyToBigintOnItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :id, :bigint, unique: true, null: false, auto_increment: true
  end
end
