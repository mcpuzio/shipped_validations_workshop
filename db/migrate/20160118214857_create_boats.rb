class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :boat_name
      t.integer :container_capacity
      t.string :current_boat_location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
