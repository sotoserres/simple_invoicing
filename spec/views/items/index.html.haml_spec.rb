require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :category => "Category",
        :subcategory => "Subcategory",
        :name => "Name",
        :description => "Description",
        :stock => 2,
        :code => "Code",
        :barcode => "Barcode",
        :price => 3.5,
        :supplier => 4
      ),
      Item.create!(
        :category => "Category",
        :subcategory => "Subcategory",
        :name => "Name",
        :description => "Description",
        :stock => 2,
        :code => "Code",
        :barcode => "Barcode",
        :price => 3.5,
        :supplier => 4
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Subcategory".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Barcode".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
