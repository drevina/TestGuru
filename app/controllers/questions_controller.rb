class QuestionsController < ApplicationController

before_action :find_question, only: [:show,:destroy]
before_action :find_test, only: [:index, :create]

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.each { |q| "<p>#{q.body}</p>" }
    render plain: questions.join
  end

  def show
    render plain: @question.body
  end

  def create
    question = @test.questions.new(question_params)
  end

  def destroy
    @question.destroy
    render plain: "Deleted"
  end

private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: "Can't found this question"
  end
end
