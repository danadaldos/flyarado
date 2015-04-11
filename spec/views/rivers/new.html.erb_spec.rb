require 'rails_helper'

RSpec.describe "rivers/new", type: :view do
  before(:each) do
    assign(:river, River.new(
      :station => "MyString",
      :cfs => 1
    ))
  end

  it "renders new river form" do
    render

    assert_select "form[action=?][method=?]", rivers_path, "post" do

      assert_select "input#river_station[name=?]", "river[station]"

      assert_select "input#river_cfs[name=?]", "river[cfs]"
    end
  end
end
