class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: %i[new create]

  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
