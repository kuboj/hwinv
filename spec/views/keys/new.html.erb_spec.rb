require 'spec_helper'

describe "keys/new" do
  before(:each) do
    assign(:key, stub_model(Key,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new key form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => keys_path, :method => "post" do
      assert_select "input#key_name", :name => "key[name]"
    end
  end
end
