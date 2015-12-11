require 'rails_helper'

RSpec.describe Building, type: :model do
  it "has a valid Factory" do
     temp = build(:building)
     temp.address = rand(1000).to_s + temp.address
     expect(temp).to be_valid
 end
 
 it "Is invalid without management" do
     expect(build(:building, management: nil)).to_not be_valid
 end
 it "Is invalid without address" do
     expect(build(:building, address: nil)).to_not be_valid
 end
 
 it "Is invalid without city" do
    expect(build(:building, city:nil)).to_not be_valid    
 end
 
 describe "should filter buildings" do
    
    before(:each) do
        @building = build(:building)
        @building = Building.create(:address => rand(1000).to_s+@building.address, :management => @building.management, :city => @building.city, pets:@building.pets, parking:@building.parking)
    end
    
    it "by selecting address" do
        Building.searchaddress("e").should == [@building]
    end
    
    it "by selecting company" do
        Building.searchcompany("poor").should == [@building]
    end
    
    it "by selecting city" do
        Building.searchcity("City").should == [@building]
    end
    
    it "by selecting parking" do
        Building.searchparking("t").should == [@building]
    end
    
    it "by selecting pets" do
        Building.searchpets("t").should == [@building]
    end
 end
 #It has many apartments
it { is_expected.to have_many :apartments }

 #It has many users through apartments
it { is_expected.to have_many :users }


end
