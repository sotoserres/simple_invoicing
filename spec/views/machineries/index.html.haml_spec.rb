require 'rails_helper'

RSpec.describe "machineries/index", type: :view do
  before(:each) do
    assign(:machineries, [
      Machinery.create!(
        :name => "Name",
        :condition => "Condition",
        :warranty => "Warranty",
        :user => 2
      ),
      Machinery.create!(
        :name => "Name",
        :condition => "Condition",
        :warranty => "Warranty",
        :user => 2
      )
    ])
  end

  it "renders a list of machineries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Condition".to_s, :count => 2
    assert_select "tr>td", :text => "Warranty".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
