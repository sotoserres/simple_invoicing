require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :surname => "Surname",
        :name => "Name",
        :fathername => "Fathername",
        :telephone => "Telephone",
        :cellphone => "Cellphone",
        :email => "Email",
        :city => "City",
        :address => "Address",
        :activity => "Activity"
      ),
      Customer.create!(
        :surname => "Surname",
        :name => "Name",
        :fathername => "Fathername",
        :telephone => "Telephone",
        :cellphone => "Cellphone",
        :email => "Email",
        :city => "City",
        :address => "Address",
        :activity => "Activity"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Fathername".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
    assert_select "tr>td", :text => "Cellphone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
  end
end
