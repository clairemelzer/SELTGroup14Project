class UsersController < ApplicationController
    def new
        @User = User.new
    end
    
    def user_params
       params.require(:user).permit(:name, :email, :password) 
    end
    
    def create
        email = params[:user][:email]
        if (User.where(:email => email).blank?)
            @temp = User.new
            @user = @temp.create_user user_params
            flash[:notice]= "Welcome #{@user.name} your username was successfully created."
            redirect_to buildings_path
        else
            flash[:notice] = "Sorry, this email is already taken. Try a different one"
            redirect_to :back
            
        end
    end
end
