require 'spec_helper'

describe "server_racks/new" do
  before(:each) do
    assign(:server_rack, stub_model(ServerRack,
      :name => "MyString",
      :datacenter_id => 1
    ).as_new_record)
  end

  it "renders new server_rack form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => server_racks_path, :method => "post" do
      assert_select "input#server_rack_name", :name => "server_rack[name]"
      assert_select "input#server_rack_datacenter_id", :name => "server_rack[datacenter_id]"
    end
  end
end
