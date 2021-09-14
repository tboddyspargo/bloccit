class VotesController < ApplicationController
  respond_to :html, :json
  before_action :require_sign_in
  
  def up_vote
    @post = Post.find(params[:post_id])
    update_vote(@post, 1)
    redirect_back(fallback_location: @post)
  end
  
  def down_vote
    @post = Post.find(params[:post_id])
    update_vote(@post, -1)
    redirect_back(fallback_location: @post)
  end
  
  private
  def update_vote(post, new_value)
    @vote = post.votes.where(user_id: current_user.id).first
    
    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.create(value: new_value, post: post)
    end
  end
end
