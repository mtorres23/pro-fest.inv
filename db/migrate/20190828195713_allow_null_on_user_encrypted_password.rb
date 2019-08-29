class AllowNullOnUserEncryptedPassword < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :encrypted_password, :string, default: "", null: false
    add_column :users, :encrypted_password, :string, default: ""
  end
end
