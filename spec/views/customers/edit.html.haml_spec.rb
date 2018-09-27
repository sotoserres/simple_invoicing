require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :surname => "MyString",
      :name => "MyString",
      :fathername => "MyString",
      :telephone => "MyString",
      :cellphone => "MyString",
      :email => "MyString",
      :city => "MyString",
      :address => "MyString",
      :activity => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[surname]"

      assert_select "input[name=?]", "customer[name]"

      assert_select "input[name=?]", "customer[fathername]"

      assert_select "input[name=?]", "customer[telephone]"

      assert_select "input[name=?]", "customer[cellphone]"

      assert_select "input[name=?]", "customer[email]"

      assert_select "input[name=?]", "customer[city]"

      assert_select "input[name=?]", "customer[address]"

      assert_select "input[name=?]", "customer[activity]"
    end
  end
end
