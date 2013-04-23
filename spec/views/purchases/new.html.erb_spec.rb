require 'spec_helper'

describe "purchases/new" do
  before(:each) do
    assign(:purchase, stub_model(Purchase,
      :name => "MyString",
      :price => 1.5,
      :currency => "MyString",
      :hardware_id => 1
    ).as_new_record)
  end

  it "renders new purchase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchases_path, :method => "post" do
      assert_select "input#purchase_name", :name => "purchase[name]"
      assert_select "input#purchase_price", :name => "purchase[price]"
      assert_select "input#purchase_currency", :name => "purchase[currency]"
      assert_select "input#purchase_hardware_id", :name => "purchase[hardware_id]"
    end
  end
end
