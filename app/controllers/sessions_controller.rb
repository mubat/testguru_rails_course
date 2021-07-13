class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    @user = User.find_by(login: params[:login])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cookies[:redirect] || root_path
    else
      guru_flash 'Некорректный данные. Повторите попытку', now: true
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Вы вышли из профиля'
  end
end
