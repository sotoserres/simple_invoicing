require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
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

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

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
