class RemoveBinFromLocation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :bins, :location
  end
end
