require 'spec_helper'

describe "hardwares/edit" do
  before(:each) do
    @hardware = assign(:hardware, stub_model(Hardware,
      :name => "MyString",
      :parent_id => 1,
      :position_id => 1
    ))
  end

  it "renders the edit hardware form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hardwares_path(@hardware), :method => "post" do
      assert_select "input#hardware_name", :name => "hardware[name]"
      assert_select "input#hardware_parent_id", :name => "hardware[parent_id]"
      assert_select "input#hardware_position_id", :name => "hardware[position_id]"
    end
  end
end
