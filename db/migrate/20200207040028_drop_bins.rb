class DropBins < ActiveRecord::Migration[5.0]
  def change
    drop_table :bins
  end
end
