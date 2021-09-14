class CommentsController < ApplicationController
  respond_to :html, :json
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]
  
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.new(comment_params)
    comment.user = current_user
    
    if comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash.now[:alert] = "There was a problem saving the comment. Please try again."
    end
    respond_with @post.topic, @post
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    
    if comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash.now[:alert] = "There was a problem deleting the comment. Please try agian."
    end
    respond_with @post.topic, @post
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user ||  current_user.admin?
      flash.now[:alert] = "You do not have permission to delete a comment."
      respond_with comment.post.topic, comment.post
    end
  end
end
