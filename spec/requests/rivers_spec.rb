require 'rails_helper'

RSpec.describe "Rivers", type: :request do
  describe "GET /rivers" do
    it "works! (now write some real specs)" do
      get rivers_path
      expect(response).to have_http_status(200)
    end
  end
end
