class CommentsController < ApplicationController

before_action :authenticate_user!

def create
    @idea          = Idea.find params[:idea_id]
    comment_params = params.require(:comment).permit(:body)
    @comment       = Comment.new comment_params
    @comment.idea  = @idea
    @comment.user = current_user
    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment created"
    else
      flash[:alert] = "access defined" unless can? :create, @idea
      render "/ideas/show"
    end
  end

  def destroy
    @idea = Idea.find params[:idea_id]
    @comment = Comment.find params[:id]
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to idea_path(@idea), notice: "Comment Deleted"
    # redirect_to root_path(@idea), alert: "access denied" unless can? :destroy, @idea
  end

end
