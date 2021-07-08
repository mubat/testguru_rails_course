class QuestionsController < ApplicationController

  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show; end

  def new
    @question = @test.questions.new # need to generate form
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      @question.errors.full_messages.each { |message| flash[:error] = message }
      render 'edit'
    end
  end

  def destroy
    @question.answers.destroy_all
    @question.delete
    redirect_to test_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def question_not_found
    flash[:warn] = 'Вопрос не был найден'
    redirect_to(request.env['HTTP_REFERER'])
  end
end
