class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :gmail
  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  
  def gmail
    Gmail.connect(:xoauth2, current_user.email, current_user.oauth_token)
  end
  

  
end