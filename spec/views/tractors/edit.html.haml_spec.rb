require 'rails_helper'

RSpec.describe "tractors/edit", type: :view do
  before(:each) do
    @tractor = assign(:tractor, Tractor.create!(
      :Name => "MyString",
      :Plates => "MyString"
    ))
  end

  it "renders the edit tractor form" do
    render

    assert_select "form[action=?][method=?]", tractor_path(@tractor), "post" do

      assert_select "input[name=?]", "tractor[Name]"

      assert_select "input[name=?]", "tractor[Plates]"
    end
  end
end
