module SessionsHelper

  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    current_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    current_user = user
  end

  def log_out_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
    current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

end
