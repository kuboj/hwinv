require 'spec_helper'

describe "datacenters/edit" do
  before(:each) do
    @datacenter = assign(:datacenter, stub_model(Datacenter,
      :address => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit datacenter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => datacenters_path(@datacenter), :method => "post" do
      assert_select "input#datacenter_address", :name => "datacenter[address]"
      assert_select "input#datacenter_name", :name => "datacenter[name]"
    end
  end
end
