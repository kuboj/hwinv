require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :rack_unit_id => 1,
      :hardware_id => 1
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => locations_path(@location), :method => "post" do
      assert_select "input#location_rack_unit_id", :name => "location[rack_unit_id]"
      assert_select "input#location_hardware_id", :name => "location[hardware_id]"
    end
  end
end
