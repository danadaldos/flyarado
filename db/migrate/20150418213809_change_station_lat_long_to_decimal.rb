class ChangeStationLatLongToDecimal < ActiveRecord::Migration
  def change
    change_column :stations, :latitude, :decimal
    change_column :stations, :longitude, :decimal
  end
end
