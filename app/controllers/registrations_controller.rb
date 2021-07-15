class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
