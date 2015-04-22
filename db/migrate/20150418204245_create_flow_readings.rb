class CreateFlowReadings < ActiveRecord::Migration
  def change
    create_table :flow_readings do |t|
      t.datetime :date_time
      t.decimal :cfs

      t.timestamps nul: false
    end

    add_reference :flow_readings, :station, index: true
    add_foreign_key :flow_readings, :stations
  end
end
