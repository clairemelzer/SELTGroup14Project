require 'rails_helper'

RSpec.describe Review, type: :model do
  it "has a valid Factory" do
     expect(create(:review)).to be_valid
 end
 
 it "Is invalid without comment" do
     expect(build(:review, comments: nil)).to_not be_valid
 end
 #It belongs to an apartment
 it { is_expected.to belong_to :apartment }
 
 #It belongs to a user
 it { is_expected.to belong_to :user }
 
  
end
