require 'rails_helper'

RSpec.describe "machineries/edit", type: :view do
  before(:each) do
    @machinery = assign(:machinery, Machinery.create!(
      :name => "MyString",
      :condition => "MyString",
      :warranty => "MyString",
      :user => 1
    ))
  end

  it "renders the edit machinery form" do
    render

    assert_select "form[action=?][method=?]", machinery_path(@machinery), "post" do

      assert_select "input[name=?]", "machinery[name]"

      assert_select "input[name=?]", "machinery[condition]"

      assert_select "input[name=?]", "machinery[warranty]"

      assert_select "input[name=?]", "machinery[user]"
    end
  end
end
