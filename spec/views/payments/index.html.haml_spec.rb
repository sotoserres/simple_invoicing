require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :amount => 2.5,
        :user_id => "User",
        :description => "Description"
      ),
      Payment.create!(
        :amount => 2.5,
        :user_id => "User",
        :description => "Description"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
