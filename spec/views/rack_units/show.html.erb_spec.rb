require 'spec_helper'

describe "rack_units/show" do
  before(:each) do
    @rack_unit = assign(:rack_unit, stub_model(RackUnit,
      :server_rack_id => 1,
      :row_number => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
