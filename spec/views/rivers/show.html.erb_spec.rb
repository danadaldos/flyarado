require 'rails_helper'

RSpec.describe "rivers/show", type: :view do
  before(:each) do
    @river = assign(:river, River.create!(
      :station => "Station",
      :cfs => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Station/)
    expect(rendered).to match(/1/)
  end
end
