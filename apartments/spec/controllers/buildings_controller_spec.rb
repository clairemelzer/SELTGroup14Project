require 'rails_helper'

RSpec.describe BuildingsController, type: :controller do
    describe "creating a new building" do
        it "should make the new building rendered on the template" do
            post :create, :building => {:address => "324 test st", :management=> "ANC"}
            expect(assigns(:building)).to be_truthy
        end
    end
    describe "update an existing building" do
        it "render the edit template" do
            fake_results = double('building')
            expect(Building).to receive(:find).and_return(fake_results)
            get :edit, {:id=> "1"}, {}
            expect(response). to render_template('edit')
        end
        
        it "should update that building attributes " do
            fake_building = Building.new
            fake_results = double('building')
            expect(Building).to receive(:find).and_return(fake_building)
            #expect(ActiveRecord).to receive(:update_attributes!).and_return(fake_results)
            get :update
            expect(response).to render_template('show')
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
        it "renders new template" do
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
