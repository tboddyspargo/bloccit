class User < ActiveRecord::Base
  has_many :posts
  
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }
  
  validates :name, length: { minimum: 1 }, presence: true
  validates :email, length: { minimum: 3, maximum: 254 }, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, presence: true, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  
  has_secure_password
  
  enum role: [:member, :admin]
end
