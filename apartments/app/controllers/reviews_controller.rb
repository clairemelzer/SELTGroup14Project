class ReviewsController < ApplicationController
    before_filter :set_current_user
    
    #def index
     #   @reviews = Review.all
    #end
    
    #def show
    
    #end
    
    def new
        #user_id = @current_user.id
        @review = Review.new
    end
    
    def create
        user_name = @current_user.name
        @review = Review.new(review_params)
        @review.user_name = user_name
        @review.apartment_id = params[:apartment_id]
        if @review.save
            flash[:notice] = "Your review has been added!"
            redirect_to building_apartment_path(params[:building_id], params[:apartment_id])
        else
            redirect :back
        end
    end
    
    def destroy
        @review = Review.find params[:id]
        @review.destroy
        flash[:notice] = "Review was deleted"
        redirect_to building_apartment_path(params[:building_id], params[:apartment_id])
    end
    
    def review_params
        params.require(:review).permit(:comments, :rating)
    end
end