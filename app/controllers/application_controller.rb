class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :guru_flash

  before_action :authenticate_user!, :logged_in?

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'You need authorize'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def guru_flash(message = nil, options = nil)
    options ||= {}
    options[:type] ||= :alert
    options[:now] ||= false
    if options[:now]
      flash.now[options[:type]] = message
    else
      flash[options[:type]] = message
    end
  end

end
