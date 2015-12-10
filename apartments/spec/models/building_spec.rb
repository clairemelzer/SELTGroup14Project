require 'rails_helper'

RSpec.describe Building, type: :model do
  it "has a valid Factory" do
     expect(create(:building)).to be_valid
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
 #It has many apartments
it { is_expected.to have_many :apartments }

 #It has many users through apartments
it { is_expected.to have_many :users }


end
