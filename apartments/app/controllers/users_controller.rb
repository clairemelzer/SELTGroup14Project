class UsersController < ApplicationController
    
    before_filter :set_current_user#, :only=> ['show', 'edit', 'update', 'delete']
    
    def new
        @User = User.new
    end
    
    def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end
    
    def show
        @user=@current_user
    		if	!current_user?(params[:id])	
    			flash[:warning]= 'Can only show profile of logged-in user'	
    		end
    end
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Sign up successful! Welcome to Iowa City Apartment Finder"
      redirect_to login_path
    else
      render 'new'
    end  
  end  
  
  def edit
     @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.name} was successfully updated."
    redirect_to user_path(@user)
  end
  
end
