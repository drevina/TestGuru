class TestsController < ApplicationController

before_action :find_test, only: [:show,:destroy]
before_action :find_tests, only: [:index, :create]

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    tests = @tests.each { |t| "<p>#{t.title}</p>" }
    render plain: tests.join
  end

  def show
    render plain: @test.title
  end

  def create
    test = Test.new(test_params)
    render plain: "Created"
  end

  def destroy
    @test.destroy
    render plain: "Deleted"
  end

private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: "Can't found this test"
  end
end
