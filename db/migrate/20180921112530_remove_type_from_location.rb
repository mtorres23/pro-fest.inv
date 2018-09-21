class RemoveTypeFromLocation < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :type, :string
    add_column :locations, :loc_type, :string
  end
end
