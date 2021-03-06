require 'rails_helper'

RSpec.describe User, type: :model do
 it "has a valid Factory" do
     expect(create(:user)).to be_valid
 end
 
 it "Is invalid without email" do
     expect(build(:user, email: nil)).to_not be_valid
 end
 it "Is invalid without password" do
     expect(build(:user, password: nil)).to_not be_valid
 end
  it "Is invalid without password confirmation" do
     expect(build(:user, password_confirmation: nil)).to_not be_valid
 end
  it "Is invalid without name" do
     expect(build(:user, name: nil)).to_not be_valid
 end
 it "creates a session token" do
     user = create(:user)
     expect(user.session_token).to be_truthy
 end
 it "is invalid with too short of password" do
     expect(build(:user, password: "hi")).to_not be_valid
 end
 it "is invalid with too long of name" do
  expect(build(:user, name: SecureRandom.base64(50) )).to_not be_valid
end
#It has many apartments
it { is_expected.to have_many :apartments }

#It has many buildings through apartments
it { is_expected.to have_many :buildings }

#It has many reviews through apartments
it { is_expected.to have_many :reviews }

 
end
