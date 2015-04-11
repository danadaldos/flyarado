require 'rails_helper'

RSpec.describe "rivers/edit", type: :view do
  before(:each) do
    @river = assign(:river, River.create!(
      :station => "MyString",
      :cfs => 1
    ))
  end

  it "renders the edit river form" do
    render

    assert_select "form[action=?][method=?]", river_path(@river), "post" do

      assert_select "input#river_station[name=?]", "river[station]"

      assert_select "input#river_cfs[name=?]", "river[cfs]"
    end
  end
end
