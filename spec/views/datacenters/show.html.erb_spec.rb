require 'spec_helper'

describe "datacenters/show" do
  before(:each) do
    @datacenter = assign(:datacenter, stub_model(Datacenter,
      :address => "Address",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/Name/)
  end
end
