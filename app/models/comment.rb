class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  validates :body, presence: true, length: { minimum: 5 }
  validates :user, presence: true
  
  after_create :send_favorite_emails
  
  private
  def send_favorite_emails
    post.favorites.each do |f|
      FavoriteMailer.new_comment(f.user, post, self).deliver_now
    end
  end
end
