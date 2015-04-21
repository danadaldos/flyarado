class ChangeCfsToFlowRateInFlowReading < ActiveRecord::Migration
  def change
    rename_column :flow_readings, :cfs, :flow_rate
  end
end
