require 'rails_helper'

RSpec.describe "apartments/show", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :building_id => 1,
      :user_id => 2,
      :apartment_number => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
