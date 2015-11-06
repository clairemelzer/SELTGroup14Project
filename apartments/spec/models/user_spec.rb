require 'rails_helper'

RSpec.describe User, type: :model do
 it "has a valid Factory" do
     create(:user).should be_valid
 end
 
 it "Is invalid without email" do
     build(:user, email: nil).should_not be_valid
 end
 it "Is invalid without password" do
     build(:user, password: nil).should_not be_valid
 end
 it "creates a session token" do
     user = create(:user)
     expect(user.session_token).to be_truthy
 end
 
 
end
