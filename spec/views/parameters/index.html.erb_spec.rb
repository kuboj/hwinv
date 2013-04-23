require 'spec_helper'

describe "parameters/index" do
  before(:each) do
    assign(:parameters, [
      stub_model(Parameter,
        :key_id => 1,
        :hardware_id => 2,
        :value => "Value"
      ),
      stub_model(Parameter,
        :key_id => 1,
        :hardware_id => 2,
        :value => "Value"
      )
    ])
  end

  it "renders a list of parameters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
