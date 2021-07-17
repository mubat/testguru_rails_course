class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :set_locale

  helper_method :guru_flash

  def default_url_options
    { land: I18n.locale }
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

  def after_sign_in_path_for(resource)
    return admin_tests_path if current_user.admin?
    super
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
