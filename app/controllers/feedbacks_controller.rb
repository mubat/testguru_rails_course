class FeedbacksController < ApplicationController
  def new
    @model = current_user.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(parse_params)
    if @feedback.save
      guru_flash t('.saved_and_sent')
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def parse_params
    params.require(:feedback).permit(:body)
  end
end
