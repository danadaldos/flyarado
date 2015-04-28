require 'rails_helper'

RSpec.describe Station, type: :model do
  it { should validate_presence_of :code }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :code }
  it { should validate_numericality_of(:code).only_integer }
  it { should validate_numericality_of :latitude }
  it { should validate_numericality_of :longitude }

  describe "#favorite?" do
    let (:user) { FactoryGirl.create(:user) }
    let (:station)  { FactoryGirl.create(:station) }
    context "User has not favorited the station" do
      it 'should be false' do
        expect(station.favorite?(user)).to eq(false)
      end
    end
    context "User has favorited the station" do
      it 'should be true' do
        station.favorite(user)
        expect(station.favorite?(user)).to eq(true)
      end
    end
  end
end
