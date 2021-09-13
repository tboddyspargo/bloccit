class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 1 }, presence: true
  validates :public, inclusion: { in: [true, false] }
  validates :description, length: { minimum: 5 }
end
