class TestsController < ApplicationController
  before_action :find_category, only: %i[index new create]
  before_action :find_test, only: %i[show]

  def index; end

  def show; end

  def new
    @test = @category.tests.new
  end

  def create
    @test = @category.tests.new(test_params)
    @test.created_by_id = 1 # TODO need to choose at view form
    if @test.save
      redirect_to test_path(@test)
    else
      @test.errors.full_messages.each { |message| flash[:error] = message }
      render action: 'new'
    end
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end