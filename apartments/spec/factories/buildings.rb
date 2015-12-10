FactoryGirl.define do
  factory :building do
    management  "poor management inc"
    address Faker::Address.street_address
    laundry 1
    number_apartments 15
    parking true
    pets  true
    city "Iowa City"
  end

end
