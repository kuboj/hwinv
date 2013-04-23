require 'spec_helper'

describe "server_racks/show" do
  before(:each) do
    @server_rack = assign(:server_rack, stub_model(ServerRack,
      :name => "Name",
      :datacenter_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
