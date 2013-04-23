require "spec_helper"

describe RackUnitsController do
  describe "routing" do

    it "routes to #index" do
      get("/rack_units").should route_to("rack_units#index")
    end

    it "routes to #new" do
      get("/rack_units/new").should route_to("rack_units#new")
    end

    it "routes to #show" do
      get("/rack_units/1").should route_to("rack_units#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rack_units/1/edit").should route_to("rack_units#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rack_units").should route_to("rack_units#create")
    end

    it "routes to #update" do
      put("/rack_units/1").should route_to("rack_units#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rack_units/1").should route_to("rack_units#destroy", :id => "1")
    end

  end
end
