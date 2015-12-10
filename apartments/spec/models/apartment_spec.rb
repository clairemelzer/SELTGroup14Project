require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it "has a valid Factory" do
     expect(create(:apartment)).to be_valid
 end
 
 it "Is invalid without apartment_number" do
     expect(build(:apartment, apartment_number: nil)).to_not be_valid
 end
 
 it "Is invalid without bedrooms" do
     expect(build(:apartment, bedrooms: nil)).to_not be_valid
 end
 
 it "Is invalid without bathrooms" do
     expect(build(:apartment, bathrooms: nil)).to_not be_valid
 end

 it "Is invalid without rent" do
     expect(build(:apartment, rent: nil)).to_not be_valid
 end
 
 it "Is invalid without monthly_util" do
     expect(build(:apartment, monthly_util: nil)).to_not be_valid
 end
 
 describe "should filter apartments" do
     before(:each) do
        @apartment = create(:apartment)
     end
     
     it "by selecting balcony" do
         Apartment.filterbalcony("t").should == [@apartment]
     end
     
     it "by selecting laundry" do
         Apartment.filterlaundry("t").should == [@apartment]
     end
     
     it "by selecting air" do
         Apartment.filterair("t").should == [@apartment]
     end
     
     it "by selecting bedrooms" do 
         Apartment.filterbathrooms(1).should == [@apartment]
     end
     
     it "by selecting bathrooms" do 
         Apartment.filterbedrooms(1).should == [@apartment]
     end
 end
 
 #It belongs to an apartment
 it { is_expected.to belong_to :building }
 
 #It belongs to a user
 it { is_expected.to belong_to :user }
 
 #It has many reviews
 it { is_expected.to have_many :reviews }
 
end
