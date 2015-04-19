class Station < ActiveRecord::Base
  has_many :flow_readings

  validates :code, uniqueness: true, presence: true, numericality: { only_integer: true}
  validates :name, presence: true
  validates :longitude, numericality: true
  validates :latitude, numericality: true
  # validates :stream_flow, presence: true

end
