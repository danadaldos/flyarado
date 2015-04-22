require 'rails_helper'

RSpec.describe Station, type: :model do
  it { should validate_presence_of :code }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :code }
  it { should validate_numericality_of(:code).only_integer }
  it { should validate_numericality_of :latitude}
  it { should validate_numericality_of :longitude}

end
