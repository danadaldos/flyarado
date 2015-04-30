module ApplicationHelper

  def fmt_coord(lat_long)
    number_with_precision lat_long, precision: 5
  end
  def format_flow_rate(flowrate)
    flow_rate_sting = number_with_precision flowrate, precision: 0
    "#{flow_rate_sting} cfs"
  end

end
