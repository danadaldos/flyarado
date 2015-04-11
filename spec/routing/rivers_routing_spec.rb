require "rails_helper"

RSpec.describe RiversController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rivers").to route_to("rivers#index")
    end

    it "routes to #new" do
      expect(:get => "/rivers/new").to route_to("rivers#new")
    end

    it "routes to #show" do
      expect(:get => "/rivers/1").to route_to("rivers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rivers/1/edit").to route_to("rivers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rivers").to route_to("rivers#create")
    end

    it "routes to #update" do
      expect(:put => "/rivers/1").to route_to("rivers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rivers/1").to route_to("rivers#destroy", :id => "1")
    end

  end
end
