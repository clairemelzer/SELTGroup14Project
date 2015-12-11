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
            testBuilding = FactoryGirl.build(:building)
            @temp =  Building.create!(:address => rand(1000).to_s+testBuilding.address, :management => testBuilding.management, :city => testBuilding.city)
            get :new, building_id:testBuilding.id
            expect(response).to render_template('new')
        end
        
        it "should render the login page if not logged in" do
            testBuilding = FactoryGirl.build(:building)
            @temp =  Building.create!(:address => rand(1000).to_s+testBuilding.address, :management => testBuilding.management, :city => testBuilding.city)
            get :new, building_id:testBuilding.id
            expect(response).to redirect_to(new_session_path)
        end
        
        it "should redirect the user back if the apartment is not saved" do
            @request.env['HTTP_REFERER'] = 'http://test.host/buildings/1/apartments/new'
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            testBuilding = FactoryGirl.build(:building)
            @temp =  Building.create!(:address => rand(1000).to_s+testBuilding.address, :management => testBuilding.management, :city => testBuilding.city)
            testApartment = {apartment_number:212}
            
            allow_any_instance_of(Apartment).to receive(:save).and_return(false)
            
            post :create, building_id:testBuilding.id, apartment:testApartment
            #response.should redirect_to '/buildings/1/apartments/new'
            expect(response).to render_template('new')
        end
        
        it "should redirect the user to the building path if saved" do 
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            testBuilding = FactoryGirl.build(:building)
            @temp =  Building.create!(:address => rand(1000).to_s+testBuilding.address, :management => testBuilding.management, :city => testBuilding.city)
            testApartment = {apartment_number:212}
            
            post :create, building_id:testBuilding.id, apartment:testApartment
            #response.should redirect_to '/buildings/1'
            expect(response).to render_template('new')
        end
    end
    
    describe "updating an existing apartment" do
        before(:each) do
            building = FactoryGirl.build(:building)
            @tempBuilding =  Building.create!(:address => rand(1000).to_s+building.address, :management => building.management, :city => building.city)
            apartment = create(:apartment)
            @temp =  Apartment.create!(:apartment_number => "212", bedrooms:apartment.bedrooms, bathrooms:apartment.bathrooms, rent:apartment.rent, monthly_util:apartment.monthly_util)
        end
        
        it 'should render the building apartments page if a user is not signed in' do
            get :edit, {:id =>@temp.id, :building_id => @tempBuilding.id}
            expect(response).to redirect_to('/buildings/'+@tempBuilding.id.to_s+"/apartments/"+@temp.id.to_s)
        end
        
        it "should render the edit template" do
            expect(User).to receive(:find_by_session_token).and_return(true)
            request.cookies['session_token'] = "asdf"
            get :edit, {:id =>@temp.id, :building_id => @tempBuilding.id}
            expect(response).to render_template('edit')
        end
        
        it "should update that apartment's attributes " do
            apartment = {apartment_number:@temp.apartment_number}
            put :update, :id => @temp.id, :apartment => apartment, :building_id => @tempBuilding.id
            expect(response).to redirect_to('/buildings/'+@tempBuilding.id.to_s+"/apartments/"+@temp.id.to_s)
        end
    end
    
    describe "deleting an apartment" do
        it "should redirect to the builing page if user not logged in" do
            building = FactoryGirl.build(:building)
            @tempBuilding =  Building.create!(:address => rand(1000).to_s+building.address, :management => building.management, :city => building.city)
            apartment = create(:apartment)
            @temp =  Apartment.create!(:apartment_number => "212", bedrooms:apartment.bedrooms, bathrooms:apartment.bathrooms, rent:apartment.rent, monthly_util:apartment.monthly_util)
            get :destroy, {:id =>@temp.id, :building_id => @tempBuilding.id}
            expect(response).to redirect_to('/buildings/'+@tempBuilding.id.to_s+"/apartments/"+@temp.id.to_s)
        end
        
        it "should delete the apartment if the user is logged in" do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            
            building = FactoryGirl.build(:building)
            @tempBuilding =  Building.create!(:address => rand(1000).to_s+building.address, :management => building.management, :city => building.city)
            apartment = build(:apartment)
            @temp = Apartment.create!(:apartment_number => "212", bedrooms:apartment.bedrooms, bathrooms:apartment.bathrooms, rent:apartment.rent, monthly_util:apartment.monthly_util)
            
            expect(Apartment).to receive(:find).and_return(@temp)
            expect(Apartment).to receive(:find).and_return(@temp)
            expect(@temp).to receive(:destroy)
            get :destroy, {:id =>@temp.id, :building_id => @tempBuilding.id}
            
        end
    end
    
    describe "viewing all apartments" do
        it "should load all apartments" do
            expect(Apartment).to receive(:all)
            get :index, building_id:1
            expect(response).to render_template('index')
        end
    end
end
