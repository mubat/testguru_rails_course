class ApplicationController < ActionController::Base

  helper_method :guru_flash

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
