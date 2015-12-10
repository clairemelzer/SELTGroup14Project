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
 
 #It belongs to an apartment
 it { is_expected.to belong_to :building }
 
 #It belongs to a user
 it { is_expected.to belong_to :user }
 
 #It has many reviews
 it { is_expected.to have_many :reviews }
 
end
