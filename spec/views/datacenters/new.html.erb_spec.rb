require 'spec_helper'

describe "datacenters/new" do
  before(:each) do
    assign(:datacenter, stub_model(Datacenter,
      :address => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new datacenter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => datacenters_path, :method => "post" do
      assert_select "input#datacenter_address", :name => "datacenter[address]"
      assert_select "input#datacenter_name", :name => "datacenter[name]"
    end
  end
end
