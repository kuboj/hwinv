require 'spec_helper'

describe "rack_units/edit" do
  before(:each) do
    @rack_unit = assign(:rack_unit, stub_model(RackUnit,
      :server_rack_id => 1,
      :row_number => 1
    ))
  end

  it "renders the edit rack_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rack_units_path(@rack_unit), :method => "post" do
      assert_select "input#rack_unit_server_rack_id", :name => "rack_unit[server_rack_id]"
      assert_select "input#rack_unit_row_number", :name => "rack_unit[row_number]"
    end
  end
end
