class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :require_login

  I18n.locale = :de

  def default_url_options
    {:locale => I18n.locale}
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to access this section'
      redirect_to log_in_path
    end
  end
end
