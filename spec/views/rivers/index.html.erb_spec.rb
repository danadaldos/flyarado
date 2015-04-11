require 'rails_helper'

RSpec.describe "rivers/index", type: :view do
  before(:each) do
    assign(:rivers, [
      River.create!(
        :station => "Station",
        :cfs => 1
      ),
      River.create!(
        :station => "Station",
        :cfs => 1
      )
    ])
  end

  it "renders a list of rivers" do
    render
    assert_select "tr>td", :text => "Station".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
