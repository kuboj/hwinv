require 'spec_helper'

describe "parameters/show" do
  before(:each) do
    @parameter = assign(:parameter, stub_model(Parameter,
      :key_id => 1,
      :hardware_id => 2,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Value/)
  end
end
