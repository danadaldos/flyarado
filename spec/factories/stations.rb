FactoryGirl.define do
  factory :station do
    name { Faker::Address.city }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    code { Faker::Code.ean }
  end

end
