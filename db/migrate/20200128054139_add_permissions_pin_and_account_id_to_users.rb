class AddPermissionsPinAndAccountIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :account, foreign_key: true
    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
    remove_column :users, :is_event_admin, :boolean
    remove_column :users, :is_crew, :boolean
    remove_column :users, :is_tent_manager, :boolean
    add_column :users, :permission_level, :integer
    add_column :users, :pin_number, :string
  end
end
