require 'spec_helper'

describe "parameters/edit" do
  before(:each) do
    @parameter = assign(:parameter, stub_model(Parameter,
      :key_id => 1,
      :hardware_id => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => parameters_path(@parameter), :method => "post" do
      assert_select "input#parameter_key_id", :name => "parameter[key_id]"
      assert_select "input#parameter_hardware_id", :name => "parameter[hardware_id]"
      assert_select "input#parameter_value", :name => "parameter[value]"
    end
  end
end
