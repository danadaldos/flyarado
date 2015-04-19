require 'JSON'
require 'open-uri'

class FlowReading < ActiveRecord::Base
  belongs_to :station

  def self.get_data
    request = open('http://waterservices.usgs.gov/nwis/dv/?format=json,1.1&stateCd=co&siteType=ST&siteStatus=active')
    result = JSON.parse(request.read)
    readings = result['value']['timeSeries']
    # Jason's suggestion= readings = result['value']['timeSeries'].map{|result| FlowReadingResult.new(result) }

    readings.each do |reading|
      # jason's example/re-factor lines 15,16,17
      # flow_reading = reading['values'].first['value']
      # flow_rate = flow_reading.first['value'].to_f
      # flow_recorded_at = flow_reading.first['dateTime']

      flow_rate = reading['values'].first['value'].first['value'].to_f
      date_time = reading['values'].first['value'].first['dateTime']
      # date_time = DateTime.parse(date_time)
      station_name = reading['sourceInfo']['siteName']
      latitude = reading['sourceInfo']['geoLocation']['geogLocation']['latitude'].to_f
      longitude = reading['sourceInfo']['geoLocation']['geogLocation']['longitude'].to_f
      station_code = reading['sourceInfo']['siteCode'].first['value'].to_i
      Station.where(code: station_code).first_or_create
      # old way? station = Station.find_or_create_by(code: station_code) do |station|
        station.name = station_name
        station.latitude = latitude
        station.longitude = longitude
      end
      self.create(cfs: flow_rate, station: station, date_time: date_time)
    end
  end
