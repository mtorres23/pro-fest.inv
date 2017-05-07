class AddQuantityToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :qty, :integer
  end
end
