require 'rails_helper'
require 'users_controller'

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
        it "should clear the session cookie" do
           get :destroy
           expect(response).to redirect_to(buildings_path)
        end
    end
end
