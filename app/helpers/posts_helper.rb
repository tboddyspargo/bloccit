module PostsHelper
  
  def user_is_authorized_for_posts?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end
  
  def user_is_authorized_to_modify_posts?(post)
    current_user and (current_user == post.user or current_user.admin? or current_user.moderator?)
  end
  
end
