class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      @user.errors.full_messages.each { |message| flash[:error] = message }
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end
end
