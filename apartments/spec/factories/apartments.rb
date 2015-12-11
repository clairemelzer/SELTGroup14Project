FactoryGirl.define do
  factory :apartment do
    building_id 1
    apartment_number 1
    bedrooms 1
    bathrooms 1
    rent 350
    user_id 1
    monthly_util 75
    central_air true
    balcony true
    laundry_in_unit true
  end

end
