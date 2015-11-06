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
 it "creates a session token" do
     user = create(:user)
     expect(user.session_token).to be_truthy
 end
 
 
end
