require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :surname => "Surname",
      :name => "Name",
      :fathername => "Fathername",
      :telephone => "Telephone",
      :cellphone => "Cellphone",
      :email => "Email",
      :city => "City",
      :address => "Address",
      :activity => "Activity"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Fathername/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/Cellphone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Activity/)
  end
end
