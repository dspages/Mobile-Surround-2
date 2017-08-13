class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :moderator?

  def log_in!(user)
    session[:session_token] = user.reset_token!
  end

  def log_out
    if logged_in?
      current_user.reset_token!
      current_user.sound_group_id = -1
      session[:session_token] = nil
    end
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to sound_groups_url if logged_in?
  end

end
