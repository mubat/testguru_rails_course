class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    @user = User.find_by(login: params[:login])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
end
