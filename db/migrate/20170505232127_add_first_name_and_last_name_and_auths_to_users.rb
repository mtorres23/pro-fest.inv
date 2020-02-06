class AddFirstNameAndLastNameAndAuthsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_event_admin, :boolean
    add_column :users, :is_crew, :boolean
    add_column :users, :is_tent_manager, :boolean
    add_column :users, :event_id, :string
  end
end
