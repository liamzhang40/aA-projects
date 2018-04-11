class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :ensure_logged_in
  protect_from_forgery with: :exception

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to cats_url if logged_in?
  end

  def login_user!(user)
    @curernt_user = user
    session[:session_token] = user.reset_sesssion_token!
  end

end
