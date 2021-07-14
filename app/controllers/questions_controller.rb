class QuestionsController < ApplicationController

before_action :find_question, only: [:show, :edit, :update, :destroy]
before_action :find_test, only: [:index, :new, :show, :edit, :update, :destroy]

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show; end

  def new
    @questions = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to test_path(@test)
  end

private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Can't found this question"
  end
end