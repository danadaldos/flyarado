
require 'yaml'
require 'json'
require "open-uri"


#--------
def get_usgs_stats(url)
  response_body = open(url).read

  table_lines = response_body.lines.reject { |line| line.start_with?'#' }

  headers = table_lines.shift.split
  table_lines.shift # ignore line after headers

  table_lines.map do |line|
    Hash[headers.zip line.split("\t")]
  end
end

river_stats_url = "http://waterdata.usgs.gov/co/nwis/current?index_pmcode_STATION_NM=1&index_pmcode_DATETIME=2&index_pmcode_00060=3&group_key=county_cd&sitefile_output_format=rdb&column_name=site_no&column_name=station_nm&column_name=coord_acy_cd&column_name=coord_datum_cd&column_name=map_nm&sort_key_2=station_nm&html_table_group_key=county_cd&format=rdb&rdb_compression=value&list_of_search_criteria=realtime_parameter_selection"
#river_stats_url = "http://waterservices.usgs.gov/nwis/dv/?format=rdb&stateCd=co&startDT=2015-04-01&endDT=2015-04-14&statCd=00003&siteType=ST"
sites = get_usgs_stats(river_stats_url)
#-----------

puts sites[1].to_yaml

puts "Entries #{sites.size}"


sites.take(10).each do |site|
  site_no = site["site_no"]
  puts site["station_nm"]


  site_url = "http://waterdata.usgs.gov/nwis/dv?cb_00060=on&format=rdb&site_no=#{site_no}&referred_module=sw&period=&begin_date=2014-04-13&end_date=2015-04-13"
  site_readings = get_usgs_stats(site_url)
  puts "  Entries #{site_readings.size}"
  puts "  cfs #{site_readings[1]["02_00060_00003"]}"


end