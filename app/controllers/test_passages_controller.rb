class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      BadgesService.new(@test_passage).reward
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    gist_service.call
    if gist_service.success?
      current_user.gists.create(question: @test_passage.current_question, url: gist_service.url)
      guru_flash t('.success_html', link: helpers.link_to('Gist', gist_service.url), target: '_blank'), type: :notice
    else
      guru_flash t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
