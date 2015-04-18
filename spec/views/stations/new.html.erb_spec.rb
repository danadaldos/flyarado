require 'rails_helper'

RSpec.describe "stations/new", type: :view do
  before(:each) do
    assign(:station, Station.new(
      :name => "MyString",
      :latitude => 1,
      :longitude => 1
    ))
  end

  it "renders new station form" do
    render

    assert_select "form[action=?][method=?]", stations_path, "post" do

      assert_select "input#station_name[name=?]", "station[name]"

      assert_select "input#station_latitude[name=?]", "station[latitude]"

      assert_select "input#station_longitude[name=?]", "station[longitude]"
    end
  end
end
