class FlowReadingResult
  attr_reader :flow_rate, :date_time, :station_name, :longitude, :latitude, :station_code

  def initialize(result_sets)

    flow_reading = result_sets['values'].first['value'].first
    @flow_rate = flow_reading['value'].to_f
    @date_time = DateTime.parse(flow_reading['dateTime'])

    source_info = result_sets['sourceInfo']
    @station_name = source_info['siteName']
    @latitude = source_info['geoLocation']['geogLocation']['latitude'].to_f
    @longitude = source_info['geoLocation']['geogLocation']['longitude'].to_f
    @station_code = source_info['siteCode'].first['value'].to_i
  end
end