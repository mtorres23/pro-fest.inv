class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :event, foreign_key: true
      t.references :location, foreign_key: true
      t.string :role
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
