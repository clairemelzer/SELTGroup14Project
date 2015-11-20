require 'rails_helper'
require 'spec_helper'
require 'buildings_controller'

RSpec.describe BuildingsController, type: :controller do
    describe "creating a new building" do
        it "should make the new building rendered on the template" do
            post :create, :building => {:address => "324 test st", :management=> "ANC"}
            expect(assigns(:building)).to be_truthy
        end
        it 'should render the new template with bad parameters' do
            post :create, :building => {:address => "", :management=> ""}
            expect(response).to render_template('new')
        end
    end
    describe "update an existing building" do
        before(:each) do
            building = create(:building)
            @temp =  Building.create!(:address => building.address, :management => building.management)
        end
        
        it 'render the buildings page if a user is not signed in' do
            get :edit, {:id =>@temp.id}
            expect(response).to redirect_to('/buildings.'+@temp.id.to_s)
        end
        
        #implement when edit buildings functionality added, should redirect to login for now
        it "render the edit template" do
            #need to implement user sign in for @currentuser to = 1, otherwise it will redirect to buildings path
            expect(User).to receive(:find_by_session_token).and_return(true)
            request.cookies['session_token'] = "asdf"
            
            get :edit, {:id => @temp.id}
            #expect(response).to redirect_to(login_path)
            #expect(response).to redirect_to('/buildings/edit.'+@temp.id.to_s)
            expect(response).to render_template('edit')
        end
        
        #implement when edit buildings functionality added, should redirect to login for now
        it "should update that building attributes " do
            
            building = {address:@temp.address, management:@temp.management}
            get :update, :id => @temp.id, :building => building
            expect(response).to redirect_to('/buildings.'+@temp.id.to_s)
        end
    end
    
    describe "displaying a building" do
        it "should render the show template" do
            fake_results = double('building')
            expect(Building).to receive(:find).and_return(fake_results)
            get :show, {:id => "1"}
            expect(response).to render_template('show')
        end
    end
    
    describe "adding new building" do
        
        it 'should redirect back to building path if user is not logged in' do
            get :new
            expect(response).to redirect_to(buildings_path)
        end
        
        #need to add user login otherwise it redirects to buildings path
        it "renders new template" do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            
            get :new
            expect(response).to render_template('new')
        end
    end
    
    describe "viewing all buildings" do
        it "renders index template" do
            get :index
            expect(response).to render_template('index')
            expect(assigns(:buildings)).to be_truthy
        end
    end
    
    describe "delete existing building" do
        it "should redirect user to all buildings page after deletion" do
            fake_results = Building.new
            expect(Building).to receive(:find).and_return(fake_results)
            get :destroy, {:id=> "1"}, {}
            expect(response).to redirect_to(buildings_path)
        end
    end
end
