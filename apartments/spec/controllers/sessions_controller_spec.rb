require 'rails_helper'
require 'users_controller'
require 'application_controller'

RSpec.describe SessionsController, type: :controller do
    describe "creating a new user account" do
        it "renders the new template for the user" do
            get :new
            expect(response).to render_template("new")
        end
        
        it "redirects the user the buildings homepage upon logging in" do
            #post :create, {} {session[:email] = "test@123.yahoo.com", session[:password]= "12341234"}
            #expect(response).to redirect_to(buildings_path)
        end
        
        it 'redirects the user to the buildings new page if verification failed' do
            #get :create, {}, {}
            #expect(response).to redirect_to(new_session_path)
        end
    end
    
    describe "logging out of account" do
        it "redirects to buildings_path" do
           get :destroy
           expect(response).to redirect_to(buildings_path)
        end
    end
    
    describe "destroy" do
        it "removes the current session token" do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
            expect(cookies[:session_token]).to_not be_nil
            
            get :destroy
            expect(cookies[:session_token]).to be_nil
        end
        it "removes the current user" do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
            expect(@current_user).to_not be_nil
            
            get :destroy
            expect(@current_user).to be_nil
        end
        it "notifies the user of logout" do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
            expect(cookies[:session_token]).to_not be_nil
            
            get :destroy
            expect(flash[:notice]).to be_present
        end
    
    end
    describe "create" do
        it "creates a session cookie on valid login" do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
            expect(cookies[:session_token]).to_not be_nil
        end
        it "creates a current user on valid login" do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
            expect(@current_user).to_not be_nil
        end
        
        it "redirects to buildings_path on valid login" do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
            expect(response).to redirect_to(buildings_path)
        end
        it "renders new on invalid login" do
            user = create(:user)
            post :create, {:session=> {:email => "invalid", :password => "invalid"} }
            expect(response).to render_template(:new)
            
        end
        it "gives warning on invalid login" do
             user = create(:user)
            post :create, {:session=> {:email => "invalid", :password => "invalid"} }
            expect(flash[:warning]).to be_present
        end
    end
        
end
