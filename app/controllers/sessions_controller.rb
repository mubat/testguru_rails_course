# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only: %i[new create]

  # POST /resource/sign_in
  def create
    super
    guru_flash t('sessions.signed_in', first_name: current_user.first_name, last_name: current_user.last_name),
               type: :notice
  end
end
