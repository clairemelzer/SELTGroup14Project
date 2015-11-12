require 'rails_helper'

RSpec.describe "apartments/index", type: :view do
  before(:each) do
    assign(:apartments, [
      Apartment.create!(
        :building_id => 1,
        :user_id => 2,
        :apartment_number => 3
      ),
      Apartment.create!(
        :building_id => 1,
        :user_id => 2,
        :apartment_number => 3
      )
    ])
  end

  it "renders a list of apartments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
