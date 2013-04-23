require "spec_helper"

describe HardwaresController do
  describe "routing" do

    it "routes to #index" do
      get("/hardwares").should route_to("hardwares#index")
    end

    it "routes to #new" do
      get("/hardwares/new").should route_to("hardwares#new")
    end

    it "routes to #show" do
      get("/hardwares/1").should route_to("hardwares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hardwares/1/edit").should route_to("hardwares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hardwares").should route_to("hardwares#create")
    end

    it "routes to #update" do
      put("/hardwares/1").should route_to("hardwares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hardwares/1").should route_to("hardwares#destroy", :id => "1")
    end

  end
end
