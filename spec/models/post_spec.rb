require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  describe "validations" do
    
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
    
    it { should have_many(:comments) }
    it { should have_many(:votes) }
    it { should have_many(:favorites) }
    
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:user) }
    
    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:body).is_at_least(20) }
  end

  describe "attributes" do
    it "has title and body attributes" do
        expect(post).to have_attributes(title: post.title, body: post.body, user: post.user)
    end
  end
  
  describe "voting" do
    before do
      3.times { create(:vote, post: post, value: 1) }
      2.times { create(:vote, post: post, value: -1)  }
      @up_votes = post.votes.where(value: 1).count
      @down_votes = post.votes.where(value: -1).count
    end
    
    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect(post.up_votes).to eq(@up_votes)
      end
    end
    
    describe "#down_votes" do
      it "counts the number of votes with the value = -1" do
        expect(post.down_votes).to eq(@down_votes) 
      end
    end
    
    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect(post.points).to eq(@up_votes - @down_votes)
      end
    end
    
    describe "#update_rank" do
      it "calculates the correct rank" do
        expect(post.rank).to eq (post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
      end
 
      it "updates the rank when an up vote is created" do
        old_rank = post.rank
        create(:vote, post: post, value: 1)
        expect(post.rank).to eq (old_rank + 1)
      end
 
      it "updates the rank when a down vote is created" do
        old_rank = post.rank
        create(:vote, post: post, value: -1)
        expect(post.rank).to eq (old_rank - 1)
      end
    end
  end
end
