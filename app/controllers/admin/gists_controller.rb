class Admin::GistsController < Admin::BaseController
  before_action :find_gist, only: %i[show destroy]

  def index
    @gists = Gist.all
  end

  def show; end

  def destroy
    @gist.delete
    redirect_to admin_gists_path
  end

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end

end
