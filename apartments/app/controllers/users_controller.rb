class UsersController < ApplicationController
    def new
        @User = User.new
    end
    
    def user_params
       params.require(:user).permit(:name, :email, :password) 
    end
    
    def create
        @user = User.create!(user_params)
        flash[:notice] = "Welcome #{@user.name} your username was successfully created."
        redirect_to buildings_path
    end
end
