class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
