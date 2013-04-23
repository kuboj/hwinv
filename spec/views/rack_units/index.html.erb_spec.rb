require 'spec_helper'

describe "rack_units/index" do
  before(:each) do
    assign(:rack_units, [
      stub_model(RackUnit,
        :server_rack_id => 1,
        :row_number => 2
      ),
      stub_model(RackUnit,
        :server_rack_id => 1,
        :row_number => 2
      )
    ])
  end

  it "renders a list of rack_units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
