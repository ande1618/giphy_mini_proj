class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    render file: "/public/404" unless current_user && current_admin?
  end

  def current_admin?
    if current_user.role == 1
      true
    else
      false
    end
  end
end
