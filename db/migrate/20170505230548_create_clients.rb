class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :company_id
      t.integer :access_key
      t.text :address
      t.integer :admin_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end