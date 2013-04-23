require 'spec_helper'

describe "datacenters/index" do
  before(:each) do
    assign(:datacenters, [
      stub_model(Datacenter,
        :address => "Address",
        :name => "Name"
      ),
      stub_model(Datacenter,
        :address => "Address",
        :name => "Name"
      )
    ])
  end

  it "renders a list of datacenters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
