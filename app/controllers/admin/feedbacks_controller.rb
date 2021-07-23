class Admin::FeedbacksController < Admin::BaseController
  before_action :find_feedback, only: %i[show destroy]

  def index
    @feedbacks = Feedback.all
  end

  def show; end

  def destroy
    @feedback.delete
    redirect_to admin_feedbacks_path
  end

  private

  def find_feedback
    @feedback = Feedback.find(params[:id])
  end
end
