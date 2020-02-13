class RemoveUnitFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :unit
  end
end
