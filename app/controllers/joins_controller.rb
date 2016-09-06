class JoinsController < ApplicationController

  before_action :authenticate_user!

  def create
   join      = current_user.joins.new
   idea      = Idea.find params[:idea_id]
   join.idea = idea
   if join.save
     redirect_to idea, notice: "Joined!"
   else
     redirect_to idea, alert: "Can't join!"
   end
  end

  def destroy
    idea = Idea.find params[:idea_id]
    join = current_user.joins.find params[:id]
    join.destroy
    redirect_to idea, notice: "Un-joined"
  end

end
