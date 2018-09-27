require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :category => "MyString",
      :subcategory => "MyString",
      :name => "MyString",
      :description => "MyString",
      :stock => 1,
      :code => "MyString",
      :barcode => "MyString",
      :price => 1.5,
      :supplier => 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[category]"

      assert_select "input[name=?]", "item[subcategory]"

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[description]"

      assert_select "input[name=?]", "item[stock]"

      assert_select "input[name=?]", "item[code]"

      assert_select "input[name=?]", "item[barcode]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[supplier]"
    end
  end
end
