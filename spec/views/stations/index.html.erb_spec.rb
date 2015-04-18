require 'rails_helper'

RSpec.describe "stations/index", type: :view do
  before(:each) do
    assign(:stations, [
      Station.create!(
        :name => "Name",
        :latitude => 1,
        :longitude => 2
      ),
      Station.create!(
        :name => "Name",
        :latitude => 1,
        :longitude => 2
      )
    ])
  end

  it "renders a list of stations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
