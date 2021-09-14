class PostsController < ApplicationController
  respond_to :html, :json 
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]
  
  def show
    @post = Post.find(params[:id])
    respond_with @post.topic, @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    respond_with @topic, @post
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    
    if @post.save
      flash[:notice] = "Post was saved."
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
    respond_with @topic, @post
  end

  def edit
    @post = Post.find(params[:id])
    respond_with @post.topic, @post
  end
  
  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    
    if @post.save
      flash[:notice] = "Post was updated."
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
    end
    respond_with @post.topic, @post
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the pos."
    end
    respond_with @post.topic
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def authorize_user
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end
end
