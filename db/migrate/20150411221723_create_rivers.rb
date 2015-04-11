class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :station
      t.integer :cfs

      t.timestamps null: false
    end
  end
end
