require 'rails_helper'

RSpec.describe "machineries/new", type: :view do
  before(:each) do
    assign(:machinery, Machinery.new(
      :name => "MyString",
      :condition => "MyString",
      :warranty => "MyString",
      :user => 1
    ))
  end

  it "renders new machinery form" do
    render

    assert_select "form[action=?][method=?]", machineries_path, "post" do

      assert_select "input[name=?]", "machinery[name]"

      assert_select "input[name=?]", "machinery[condition]"

      assert_select "input[name=?]", "machinery[warranty]"

      assert_select "input[name=?]", "machinery[user]"
    end
  end
end
