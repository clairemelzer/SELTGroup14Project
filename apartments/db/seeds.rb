# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

buildings = [{:address => '319 Court St', :management => "Hawkeye Campus Properties", pets:"cats", laundry:4, number_apartments:12, parking:"onstreet", id:1},
    	  {:address => '19 E Burlington St', :management => "Apartments Downtown", pets:"dogs", laundry:6, number_apartments:12, parking:"garage", id:2},
    	  {:address => '408 S Van Buren St', :management => "Apartments Downtown", pets:"none", laundry:8, number_apartments:24, parking:"none",id:3}]

buildings.each do |building|
  Building.create!(building)
end

apartments = [{:apartment_number => "1", :bedrooms => "1", :bathrooms => "1", :rent => "850"}, 
              {apartment_number: "2", bedrooms: "1", bathrooms: "2", rent:"750"}]

apartments.each do |apartment|
  temp = Apartment.new(apartment)
  temp.building_id = 1
  temp.save!
end
