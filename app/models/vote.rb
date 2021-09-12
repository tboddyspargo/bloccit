class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  after_save :update_post
  
  validates :value, presence: true, inclusion: { in: [-1, 1] }
  
  private
  
  def update_post
    post.update_rank
  end
end
