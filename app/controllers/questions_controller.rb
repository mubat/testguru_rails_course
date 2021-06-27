class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: { questions: Question.all } }
      format.xml { render xml: { questions: Question.all } }
    end
  end

  def show; end

  def new
    @question = @test.questions.new # need to generate form
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_question_path(id: @question.id, test_id: params[:test_id])
    else
      render action: 'new'
    end
  end

  def destroy
    @question.answers.destroy_all
    @question.delete
    redirect_to test_questions_path(test_id: params[:test_id])
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
    redirect_to test_questions_path(test_id: params[:test_id])
  end
end
