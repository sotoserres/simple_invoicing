require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :category => "Category",
      :subcategory => "Subcategory",
      :name => "Name",
      :description => "Description",
      :stock => 2,
      :code => "Code",
      :barcode => "Barcode",
      :price => 3.5,
      :supplier => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Subcategory/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Barcode/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
  end
end
