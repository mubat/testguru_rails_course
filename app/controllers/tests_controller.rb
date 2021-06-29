class TestsController < ApplicationController
  before_action :find_category, only: %i[index]
  before_action :find_test, only: %i[show]

  def index; end

  def show; end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
