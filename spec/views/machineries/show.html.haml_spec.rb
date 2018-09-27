require 'rails_helper'

RSpec.describe "machineries/show", type: :view do
  before(:each) do
    @machinery = assign(:machinery, Machinery.create!(
      :name => "Name",
      :condition => "Condition",
      :warranty => "Warranty",
      :user => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Condition/)
    expect(rendered).to match(/Warranty/)
    expect(rendered).to match(/2/)
  end
end
