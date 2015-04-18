class Station < ActiveRecord::Base
  has_many :flow_readings
end
