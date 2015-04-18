require 'rails_helper'

RSpec.describe "stations/edit", type: :view do
  before(:each) do
    @station = assign(:station, Station.create!(
      :name => "MyString",
      :latitude => 1,
      :longitude => 1
    ))
  end

  it "renders the edit station form" do
    render

    assert_select "form[action=?][method=?]", station_path(@station), "post" do

      assert_select "input#station_name[name=?]", "station[name]"

      assert_select "input#station_latitude[name=?]", "station[latitude]"

      assert_select "input#station_longitude[name=?]", "station[longitude]"
    end
  end
end
