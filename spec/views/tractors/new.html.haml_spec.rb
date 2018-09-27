require 'rails_helper'

RSpec.describe "tractors/new", type: :view do
  before(:each) do
    assign(:tractor, Tractor.new(
      :Name => "MyString",
      :Plates => "MyString"
    ))
  end

  it "renders new tractor form" do
    render

    assert_select "form[action=?][method=?]", tractors_path, "post" do

      assert_select "input[name=?]", "tractor[Name]"

      assert_select "input[name=?]", "tractor[Plates]"
    end
  end
end
