class QuestionsController < ApplicationController

  before_action :find_test

  def index; end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new # need to generate form
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
