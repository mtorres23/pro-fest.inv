class AddUnitToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :unit, :integer
  end
end
