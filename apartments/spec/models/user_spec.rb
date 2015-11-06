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
 it "sets a user session token on create_user" do
     user = User.new
     user_attributes = {"id"=>1, "name"=>nil, "email"=>"testemail", "password"=>"testpwd123" }
     user.create_user(user_attributes)
     expect(user.session_token).to eq(@session_token)
 end
 
 
end
