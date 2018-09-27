require 'rails_helper'

RSpec.describe "tractors/index", type: :view do
  before(:each) do
    assign(:tractors, [
      Tractor.create!(
        :Name => "Name",
        :Plates => "Plates"
      ),
      Tractor.create!(
        :Name => "Name",
        :Plates => "Plates"
      )
    ])
  end

  it "renders a list of tractors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Plates".to_s, :count => 2
  end
end
