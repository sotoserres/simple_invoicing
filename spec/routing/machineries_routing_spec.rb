require "rails_helper"

RSpec.describe MachineriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/machineries").to route_to("machineries#index")
    end

    it "routes to #new" do
      expect(:get => "/machineries/new").to route_to("machineries#new")
    end

    it "routes to #show" do
      expect(:get => "/machineries/1").to route_to("machineries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/machineries/1/edit").to route_to("machineries#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/machineries").to route_to("machineries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/machineries/1").to route_to("machineries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/machineries/1").to route_to("machineries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/machineries/1").to route_to("machineries#destroy", :id => "1")
    end
  end
end
