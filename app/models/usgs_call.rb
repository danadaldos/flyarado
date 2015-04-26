class UsgsCall
  def initialize
    request = open('http://waterservices.usgs.gov/nwis/dv/?format=json,1.1&stateCd=co&siteType=ST&siteStatus=active')
    JSON.parse(request.read)
  end
end
