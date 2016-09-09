class JoinsController < ApplicationController

  before_action :authenticate_user!

  def create
   join      = current_user.joins.new
   idea      = Idea.find params[:idea_id]
   join.idea = idea
   authorize! :create, join
   if join.save
     redirect_to root_path, notice: "You have joined #{idea.title}!"
   else
     redirect_to root_path, alert: "Can't join!"
   end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    join = current_user.joins.find params[:id]
    authorize! :destroy, join
    join.destroy
    redirect_to root_path, notice: "You have left #{idea.title}!"
  end

end
