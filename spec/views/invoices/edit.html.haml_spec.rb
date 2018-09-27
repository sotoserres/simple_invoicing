require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :company => nil,
      :description => "MyText",
      :quantity => 1,
      :price => 1.5
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input[name=?]", "invoice[company_id]"

      assert_select "textarea[name=?]", "invoice[description]"

      assert_select "input[name=?]", "invoice[quantity]"

      assert_select "input[name=?]", "invoice[price]"
    end
  end
end
