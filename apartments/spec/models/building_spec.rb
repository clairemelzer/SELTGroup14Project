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
end
