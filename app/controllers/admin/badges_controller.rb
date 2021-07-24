class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(permit_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def show; end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def permit_params
    params.require(:badge).permit(:name, :filename, :rule)
  end
end
