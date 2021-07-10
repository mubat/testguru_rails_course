class AnswersController < ApplicationController
  before_action :find_question, only: %i[index]
  before_action :set_answer, only: %i[show edit update destroy]

  # GET /answers or /answers.json
  def index
    @answers = @question.answers.all
  end

  # GET /answers/1 or /answers/1.json
  def show; end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit; end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :is_correct, :question_id)
  end
end
