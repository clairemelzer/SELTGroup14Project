require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it "has a valid Factory" do
     expect(create(:review)).to be_valid
 end
 
 #It belongs to an apartment
 it { is_expected.to belong_to :building }
 
 #It belongs to a user
 it { is_expected.to belong_to :user }
 
 #It has many reviews
 it { is_expected.to have_many :reviews }
 
end
