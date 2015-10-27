class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @comment = @question.comments.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save

      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
    else
      render :index
    end
  end

  def update
    @question = Question.find(params[:id])
    if
      params[:choice] == "firstCount"
      @question.firstCount += 1
      @question.save
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
    else
      @question.secondCount += 1
      @question.save
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:firstOption, :secondOption, :firstCount, :secondCount)
  end
end
