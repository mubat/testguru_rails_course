class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.created_by = @current_user
    if @test.save
      redirect_to test_path(@test)
    else
      @test.errors.full_messages.each { |message| flash[:error] = message }
      render 'new'
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      @test.errors.full_messages.each { |message| flash[:error] = message }
      render 'edit'
    end
  end

  def destroy
    @test.delete
    redirect_to tests_path(@test)
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :created_by_id, :category_id)
  end

  def set_user
    @user = User.first
  end
end
