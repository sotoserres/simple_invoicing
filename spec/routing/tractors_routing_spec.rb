require "rails_helper"

RSpec.describe TractorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/tractors").to route_to("tractors#index")
    end

    it "routes to #new" do
      expect(:get => "/tractors/new").to route_to("tractors#new")
    end

    it "routes to #show" do
      expect(:get => "/tractors/1").to route_to("tractors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tractors/1/edit").to route_to("tractors#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tractors").to route_to("tractors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tractors/1").to route_to("tractors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tractors/1").to route_to("tractors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tractors/1").to route_to("tractors#destroy", :id => "1")
    end
  end
end
