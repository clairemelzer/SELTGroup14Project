require 'rails_helper'
require 'users_controller'
require 'application_controller'
require 'sessions_controller'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
    describe "creating new user" do
        it "render the new template" do
           get :new
           expect(response).to render_template('new')
        end
        
        it "should redirect to login path after succesful creation" do
            user = create(:user)
            current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            
            allow(User).to receive(:new).and_return(current_user)
            post :create, :user=>{:user=>"test",:email=>(rand(10000).to_s+"_test@gmail.com"),:password=>"123456",:password_confirmation=>"123456"}
            expect(response).to redirect_to(login_path)
        end
        
        it "redirect back if not successful" do
            temp = FactoryGirl.create(:user)
            post :create, :user=>{:name=>"", :email=>"",:password=>temp.password,:password_confirmation=>temp.password_confirmation}
            expect(response).to render_template('new')
        
        end
    end
    
    describe "show unlogged user info" do
        before(:each) do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
        end
        
        it "should flash a warning if id nil" do
            get :show, {:id => 50}
            expect(flash[:warning]).to be_present
        end
    end
    
    describe "showing user info" do
        before(:each) do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
        end
        
        it "renders the profile page" do
           get :show, {:id => @current_user.id}
           expect(response).to render_template('show')
        end
    end
    
    describe "editing user info" do
        it "should render the edit template" do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            
            get :edit, {:id => @current_user.id}
            expect(response).to render_template('edit')
        end
    end
    
    describe "updating user info" do
        it "make a call to update attributes" do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            
            post :update, {:user => @current_user}
            expect(flash[:notice]).to be_present
            expect(response).to redirect_to(user_path(@current_user))
        end
        
        
    end
end
