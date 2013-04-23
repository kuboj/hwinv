require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :rack_unit_id => 1,
      :hardware_id => 1
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path, :method => "post" do
      assert_select "input#location_rack_unit_id", :name => "location[rack_unit_id]"
      assert_select "input#location_hardware_id", :name => "location[hardware_id]"
    end
  end
end
