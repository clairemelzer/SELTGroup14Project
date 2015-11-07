require 'rails_helper'
require 'users_controller'
require 'application_controller'

RSpec.describe SessionsController, type: :controller do
    describe "starting a new session" do
        it "renders the new template for the user" do
            get :new
            expect(response).to render_template("new")
        end
    end
    
    describe "destroy" do
        before(:each) do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
        end
    
        it "removes the current session token" do
            expect(cookies[:session_token]).to_not be_nil
            
            get :destroy
            expect(cookies[:session_token]).to be_nil
        end
        it "removes the current user" do
            expect(@current_user).to_not be_nil
            
            get :destroy
            expect(@current_user).to be_nil
        end
        it "notifies the user of logout" do
            expect(cookies[:session_token]).to_not be_nil
            
            get :destroy
            expect(flash[:notice]).to be_present
        end
    
    end
    describe "create with valid login" do
        before(:each) do
            user = create(:user)
            post :create, {:session=> {:email => "test-email@test.com", :password => "test12345"} }
        end
        it "creates a session cookie on valid login" do
            expect(cookies[:session_token]).to_not be_nil
        end
        it "creates a current user on valid login" do
            expect(@current_user).to_not be_nil
        end
        
        it "redirects to buildings_path on valid login" do
            expect(response).to redirect_to(homepage_path)
        end
    end
    describe "create with invalid login" do
        before(:each) do
            user = create(:user)
            post :create, {:session=> {:email => "invalid", :password => "invalid"} }
        end
        
        it "renders new on invalid login" do
            expect(response).to render_template(:new)
            
        end
        it "gives warning on invalid login" do
            expect(flash[:warning]).to be_present
        end
    end
        
end
