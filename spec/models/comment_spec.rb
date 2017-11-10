require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: "New Post Title", body: "New post body.") }
  let(:comment) { Comment.create(body: "Comment body.", post: post) }
  
  describe "attributes" do
    it "has body attribute" do
      expect(comment).to have_attributes(body: "Comment body.") 
    end
  end
end
