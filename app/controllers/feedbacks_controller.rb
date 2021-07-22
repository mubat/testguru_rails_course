class FeedbacksController < ApplicationController
  def new
    @model = current_user.feedbacks.new
  end

end
