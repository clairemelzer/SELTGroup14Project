# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

buildings = [{:address => '319 Court St', :management => "Hawkeye Campus Properties"},
    	  {:address => '19 E Burlington St', :management => "Apartments Downtown"}]

buildings.each do |building|
  Building.create!(building)
end
