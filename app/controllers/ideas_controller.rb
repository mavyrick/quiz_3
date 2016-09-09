class IdeasController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

  def index
    @ideas = Idea.all
    # @user = User.find params[:first_name]
    # @idea = Idea.find params[:idea_id]
    # @like = @idea.like_for(current_user)
  end

  def new
    @idea = Idea.new
  end

  def create
  idea_params = params.require(:idea).permit(:title, :description)
  @idea = Idea.new idea_params
  @idea.user_id = current_user.id
  if @idea.save
    redirect_to idea_path(@idea)
  else
    render :new
  end
end

  def edit
    @idea = Idea.find params[:id]
  end

  def show
    @idea = Idea.find params[:id]
    @users = User.all
    @like = @idea.like_for(current_user)
    @join = @idea.join_for(current_user)
    @comment = Comment.new
    # @comment.user = current_user
  end

  def update
    idea_params = params.require(:idea).permit(:title, :description)
    @idea       = Idea.find params[:id]
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    idea = Idea.find params[:id]
    idea.destroy
    redirect_to ideas_path
  end

  # def first_name
  #   params.require(:user).permit(:first_name)
  # end

end
