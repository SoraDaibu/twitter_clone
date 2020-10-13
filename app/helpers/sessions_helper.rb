module SessionsHelper

  # login with the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # persist a user session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #To return a currently logged-in user (when applicable)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #If user is logged-in, true is returned. False is returned for any other cases.
  def logged_in?
    !current_user.nil?
  end

  # dump the pertmanent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # logout the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end



end
