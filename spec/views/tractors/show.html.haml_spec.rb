require 'rails_helper'

RSpec.describe "tractors/show", type: :view do
  before(:each) do
    @tractor = assign(:tractor, Tractor.create!(
      :Name => "Name",
      :Plates => "Plates"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Plates/)
  end
end
