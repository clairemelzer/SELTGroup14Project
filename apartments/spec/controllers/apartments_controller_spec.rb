require 'rails_helper'
require 'spec_helper'
require 'apartments_controller'

RSpec.describe ApartmentsController, type: :controller do
    describe "adding a new apartment" do
        it "should render the new template if logged in and has building" do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(true)
            request.cookies['session_token'] = "asdf"
            testBuilding = create(:building)
            @temp =  Building.create!(:address => testBuilding.address, :management => testBuilding.management)
            get :new, building_id:testBuilding.id
            expect(response).to render_template('new')
        end
        
        it "should render the login page if not logged in" do
            testBuilding = create(:building)
            @temp =  Building.create!(:address => testBuilding.address, :management => testBuilding.management)
            get :new, building_id:testBuilding.id
            expect(response).to redirect_to(new_session_path)
        end
        
        it "should redirect the user back if the apartment is not saved" do
            @request.env['HTTP_REFERER'] = 'http://test.host/buildings/1/apartments/new'
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            testBuilding = create(:building)
            @temp =  Building.create!(:address => testBuilding.address, :management => testBuilding.management)
            testApartment = {apartment_number:212}
            
            allow_any_instance_of(Apartment).to receive(:save).and_return(false)
            
            post :create, building_id:testBuilding.id, apartment:testApartment
            response.should redirect_to '/buildings/1/apartments/new'
        end
        
        it "should redirect the user to the building path if saved" do 
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            testBuilding = create(:building)
            @temp =  Building.create!(:address => testBuilding.address, :management => testBuilding.management)
            testApartment = {apartment_number:212}
            
            post :create, building_id:testBuilding.id, apartment:testApartment
            response.should redirect_to '/buildings/1'
        end
    end
    
    describe "deleting an apartment" do
        it "should remove the apartment from the database and redirect to the builing page" do
            temp = Apartment.new
            
            expect(Apartment).to receive(:find).and_return(temp)
            
            get :destroy, id:1
            expect(response).to redirect_to '/buildings/1'
        end
    end
end
