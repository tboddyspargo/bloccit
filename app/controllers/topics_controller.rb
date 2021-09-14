class TopicsController < ApplicationController
  respond_to :html, :json
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]
  
  def index
    @topics = Topic.all
    respond_with @topics
  end
  
  def show
    @topic = Topic.find(params[:id])
    respond_with @topic
  end
  
  def new
    @topic = Topic.new
    respond_with @topic
  end
  
  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
    end
    respond_with @topic
  end
  
  def edit
    @topic = Topic.find(params[:id])
    respond_with @topic
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
    
    if @topic.save
      flash[:notice] = "Topic was updated."
    else
      flash.now[:alert] = "Error saving topic. Please try again."
    end
    respond_with @topic
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the topic."
    end
    respond_with @topic, render: :index
  end
  
  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end
  
  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end
end
