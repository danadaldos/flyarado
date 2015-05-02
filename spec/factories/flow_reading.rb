FactoryGirl.define do
  factory :flow_reading do
      date_time { Time.now }
      flow_rate { rand(1..500) }
      station_id '1'
    end
  end
