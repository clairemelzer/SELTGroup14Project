require 'rails_helper'

RSpec.describe "apartments/new", type: :view do
  before(:each) do
    assign(:apartment, Apartment.new(
      :building_id => 1,
      :user_id => 1,
      :apartment_number => 1
    ))
  end

  it "renders new apartment form" do
    render

    assert_select "form[action=?][method=?]", apartments_path, "post" do

      assert_select "input#apartment_building_id[name=?]", "apartment[building_id]"

      assert_select "input#apartment_user_id[name=?]", "apartment[user_id]"

      assert_select "input#apartment_apartment_number[name=?]", "apartment[apartment_number]"
    end
  end
end
