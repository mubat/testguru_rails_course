class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  def index; end

  def show; end

  def new
    @question = Question.new # need to generate form
  end

  def create
    @question = Question.new(question_params)
    @question.test = @test
    if @question.save
      redirect_to test_question_path(id: @question.id, test_id: params[:test_id])
    else
      render action: 'new'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:tt)
  end
end
