class CommentsController < ApplicationController

  def index
    case
    when params[:user_id]
      @comments = Comment.where(user_id: params[:user_id])
    when params[:artwork_id]
      @comments = Comment.where(artwork_id: params[:artwork_id])
    else
      @comments = Comment.all
    end
    render json: @comments
  end

  def create

  end

  private

  def comment_params
    params.require(:comments).permit(:user_id, :artwork_id, :body)
  end
end
