require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: "New Post Title", body: "This is the new post's body. It is a paragraph.") }
  
  describe "attributes" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:topic) }
    
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_length_of(:body).is_at_least(20) }
    
    it "has title and body attributes" do
        expect(post).to have_attributes(title: "New Post Title", body: "This is the new post's body. It is a paragraph.")
    end
  end
end
