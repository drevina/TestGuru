class QuestionsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_question, only: %i[ show ]
  before_action :find_test, only: %i[ index ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show; end

private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Can't found this question"
  end
end
