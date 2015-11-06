
class SessionsController < ApplicationController

  def new
    # default: render 'new' template for session--i.e. login screen
  end

  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      cookies.permanent[:session_token]= user.session_token
      
      redirect_to homepage_path
    else
      flash.now[:warning] = 'Invalid email/password combination'
      render 'new'
    end  
  end

  def destroy
    cookies.delete(:session_token) 
    @current_user=nil
    flash[:notice]= 'You have logged out'
    redirect_to homepage_path
  end  

end