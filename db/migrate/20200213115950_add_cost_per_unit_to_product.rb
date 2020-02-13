class AddCostPerUnitToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cost_per_unit, :float
  end
end
