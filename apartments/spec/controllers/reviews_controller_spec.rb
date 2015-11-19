require 'rails_helper'
require 'spec_helper'
require 'reviews_controller'

RSpec.describe ReviewsController, type: :controller do
    describe "adding a new review" do
        it "should render the new template if logged in" do
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(true)
            request.cookies['session_token'] = "asdf"
            get :new, building_id:1, apartment_id:1
            expect(response).to render_template('new')
        end
        
        it "should render the login page if not logged in" do
            get :new, building_id:1, apartment_id:1
            expect(response).to redirect_to(new_session_path)
        end
        
        it "should redirect the user back if the review is not saved" do
            @request.env['HTTP_REFERER'] = 'http://test.host/buildings/1/apartments/1/reviews/new'
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            someReview = {comments:"great", rating:5}
            
            allow_any_instance_of(Review).to receive(:save).and_return(false)
            
            post :create, building_id:1, apartment_id:1, review:someReview
            response.should redirect_to '/buildings/1/apartments/1/reviews/new'
        end
        
        it "should redirect the user to the building apartment path if saved" do 
            user = create(:user)
            @current_user = User.create!(name:user.name,email:(rand(10000).to_s+user.email), password:user.password, password_confirmation:user.password_confirmation)
            expect(User).to receive(:find_by_session_token).and_return(@current_user)
            request.cookies['session_token'] = "asdf"
            someReview = {comments:"great", rating:5}
            
            post :create, building_id:1, apartment_id:1, review:someReview
            response.should redirect_to '/buildings/1/apartments/1'
        end
    end
    
    describe "deleting a review" do
        it "should removew the review from the database and redirect to the builing apartment page" do
            temp = Review.new
            
            expect(Review).to receive(:find).and_return(temp)
            
            get :destroy, id:1, building_id:1, apartment_id:1 
            expect(response).to redirect_to '/buildings/1/apartments/1'
        end
    end
end
