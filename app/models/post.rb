class Post < ActiveRecord::Base
    has_many :comments
    
    def title
      return "SPAM" if self[:id] % 5 === 1
      self[:title]
    end
end
