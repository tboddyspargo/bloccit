class FavoriteMailer < ApplicationMailer
  default from: "boddyspargo.tyler@gmail.com"
  default cc: "adrian.wisernig@bloc.io;boddyspargo.tyler@gmail.com"
  
  def new_comment(user, post, comment)
    headers['Message-ID'] = "<comments/#{comment.id}@limitless-scrubland-98400.heroku.com>"
    headers['In-Reply-To'] = "<post/#{post.id}@limitless-scrubland-98400.heroku.com"
    headers['References'] = "<post/#{post.id}@limitless-scrubland-98400.heroku.com"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(user, post)
    headers['Message-ID'] = "<post/#{post.id}@limitless-scrubland-98400.heroku.com"
    headers['In-Reply-To'] = "<post/#{post.id}@limitless-scrubland-98400.heroku.com"
    headers['References'] = "<post/#{post.id}@limitless-scrubland-98400.heroku.com"
    
    @user = user
    @post = post
    
    mail(to: user.email, subject: "Subscribed to #{post.title}")
  end
end
