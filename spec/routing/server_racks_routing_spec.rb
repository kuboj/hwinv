require "spec_helper"

describe ServerRacksController do
  describe "routing" do

    it "routes to #index" do
      get("/server_racks").should route_to("server_racks#index")
    end

    it "routes to #new" do
      get("/server_racks/new").should route_to("server_racks#new")
    end

    it "routes to #show" do
      get("/server_racks/1").should route_to("server_racks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/server_racks/1/edit").should route_to("server_racks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/server_racks").should route_to("server_racks#create")
    end

    it "routes to #update" do
      put("/server_racks/1").should route_to("server_racks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/server_racks/1").should route_to("server_racks#destroy", :id => "1")
    end

  end
end
