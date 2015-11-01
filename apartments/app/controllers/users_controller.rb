class UsersController < ApplicationController
    def new
        @User = User.new
    end
    
    def user_params
       params.require(:user).permit(:name, :email, :password) 
    end
    
    def create
        @user = User.create!(user_params)
        redirect_to buildings_path
    end
end
