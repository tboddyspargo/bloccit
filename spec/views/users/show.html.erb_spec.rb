require 'rails_helper'
require 'pry'
include SessionsHelper

RSpec.describe "users/show.html.erb", type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  
  before do
    Favorite.create!(post: post, user: user)
    create_session(user)
  end
  
  it "should render the _post partial" do
    assign(:user, user)
    render
    expect(rendered).to render_template(:partial => "_post", :count => 1)
  end
  
  it "should render the avatar of the posts's author" do
    assign(:user, user)
    author = user.favorites.sample.post.user
    render
    expect(rendered).to include author.avatar_url(28)
  end
end