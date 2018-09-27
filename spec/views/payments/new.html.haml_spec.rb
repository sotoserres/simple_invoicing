require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      :amount => 1.5,
      :user_id => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input[name=?]", "payment[amount]"

      assert_select "input[name=?]", "payment[user_id]"

      assert_select "input[name=?]", "payment[description]"
    end
  end
end
