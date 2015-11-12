require 'rails_helper'

RSpec.describe "apartments/edit", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :building_id => 1,
      :user_id => 1,
      :apartment_number => 1
    ))
  end

  it "renders the edit apartment form" do
    render

    assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do

      assert_select "input#apartment_building_id[name=?]", "apartment[building_id]"

      assert_select "input#apartment_user_id[name=?]", "apartment[user_id]"

      assert_select "input#apartment_apartment_number[name=?]", "apartment[apartment_number]"
    end
  end
end
