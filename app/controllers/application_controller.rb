class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  I18n.locale = :de

  def default_url_options
    {:locale => I18n.locale}
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
