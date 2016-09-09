class LikesController < ApplicationController

  before_action :authenticate_user!


 def create
   like      = current_user.likes.new
   idea      = Idea.find params[:idea_id]
   like.idea = idea

   authorize! :create, like
   if like.save
     redirect_to root_path, notice: "You have liked #{idea.title}!"
   else
     redirect_to root_path, alert: "Can't Like!"
   end
 end

 def destroy
   idea = Idea.find params[:idea_id]
   like = current_user.likes.find params[:id]
   authorize! :destroy, like
   like.destroy
   redirect_to root_path, notice: "You have unliked #{idea.title}!"
 end

end
