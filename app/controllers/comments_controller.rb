class CommentsController < ApplicationController
  before_action :prevent_unauthorized_user_access, except: :index
  before_action :set_variables, only: [:edit, :update, :destroy]
  def index
  end

  def edit
  end

def create
  @link = Link.find_by(id: params[:link_id])
  @comment = @link.comments.new(user: current_user, body: comment_params[:body])

  if @comment.save
    redirect_to @link, notice: 'Comment created'
  else
    redirect_to @link, notice: 'Comment was not saved. Ensure you have entered a comment'
  end
end

private

def comment_params
  params.require(:comment).permit(:body)
end 

def set_variables
  @link = Link.find_by(id: params[:link_id])
  @comment = @link.comments.find_by(id: params[:id])
end


end
