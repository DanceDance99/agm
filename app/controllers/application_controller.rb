class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_admin

  def require_admin
    if !logged_in
      flash[:error] = 'Access denied.'
      redirect_to login_path
    end
  end

  def logged_in
    @logged_in ||= User.find(session[:user_id]) if session[:user_id]
  end
end
