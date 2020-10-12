module SessionsHelper

  # login with the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #To return a currently logged-in user (when applicable)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  #If user is logged-in, true is returned. False is returned for any other cases.
  def logged_in?
    !current_user.nil?
  end

  # logout the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
