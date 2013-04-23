require 'spec_helper'

describe "hardwares/show" do
  before(:each) do
    @hardware = assign(:hardware, stub_model(Hardware,
      :name => "Name",
      :parent_id => 1,
      :position_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
