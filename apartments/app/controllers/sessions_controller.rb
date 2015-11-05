
class SessionsController < ApplicationController

  def new
    # default: render 'new' template for session--i.e. login screen
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.password==params[:user][:password]
     session[:session_token]=user.session_token
      redirect_to homepage_path
    else  
      flash[:warning] = 'Invalid user-id/e-mail combination'
      redirect_to login_path
    end  
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to homepage_path
  end  

end