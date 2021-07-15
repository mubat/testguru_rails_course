# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    set_flash_message! :notice, :signed_in_custom,
                       first_name: current_user.first_name, last_name: current_user.last_name
  end
end
