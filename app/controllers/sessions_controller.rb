class SessionsController < ApplicationController
  #this is the hot mess that is totally broken

  #create user session
  def new
  end

  def create
    user = User.find_by( email: params[:session][:email].downcase)
#the problem may be here in that users are getting created as technicians
    if user && user.authenticate(params[:session][:password])
      log_in user
      if current_user user.client?
        redirect_to user
      elsif current_user user.technician?
        redirect_to technician
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = 'You have logged out'
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

  end
