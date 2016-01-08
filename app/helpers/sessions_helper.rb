module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in(technician)
    session[:technician_id] = technician.id
  end

#need to make the current user one method and get rid of this to not confuse the system
  def tech_current_user
    @current_user ||= Technician.find_by(id: session[:technician_id])
  end

end
