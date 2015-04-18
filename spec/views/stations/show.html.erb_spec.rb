require 'rails_helper'

RSpec.describe "stations/show", type: :view do
  before(:each) do
    @station = assign(:station, Station.create!(
      :name => "Name",
      :latitude => 1,
      :longitude => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
