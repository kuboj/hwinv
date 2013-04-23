require 'spec_helper'

describe "keys/edit" do
  before(:each) do
    @key = assign(:key, stub_model(Key,
      :name => "MyString"
    ))
  end

  it "renders the edit key form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => keys_path(@key), :method => "post" do
      assert_select "input#key_name", :name => "key[name]"
    end
  end
end
