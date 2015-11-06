require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "creating new user" do
        it "render the new template" do
           get :new
           expect(response).to render_template('new')
        end
        
        it "should redirect to login path after succesful creation" do
            
        end
        
        it "redirect back if not successful" do
            temp = FactoryGirl.create(:user)
            #expect(assigns(:user)).to receive(:save).and_return(false)
            post :create, :user=>{:name=>temp.name, :email=>temp.email,:password=>temp.password,:password_confirmation=>temp.password_confirmation}
            expect(response).to render_template('new')
        
        end
    end
    
    describe "showing user info" do
        it "render the profile page" do
            user = FactoryGirl.create(:user)
            user.email = rand(100000).to_s + user.email
           temp = User.create!(:name=>user.name,:email=>user.email,:password=>user.password,:password_confirmation=>user.password_confirmation)
           # expect(UsersController).to receive(:current_user?).and_return(false)
           ApplicationController.stub(:current_user) {temp}
           get :show, {:id => temp.id}
           expect(response).to render_template('show')
        end
    end
    
end
