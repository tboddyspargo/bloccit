require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(25..100))}

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show template" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end
    
    it "assigns instance to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders new template" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end
    
    it "assigns instance to @sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end
  
  describe "POST #create" do
    it "increases sponsored_post count by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(25..100)}}.to change(SponsoredPost, :count).by(1)
    end
    
    it "assigns sponsored post to @sponsored_post" do
      post :create, topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(25..100)}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end
    
    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(25..100)}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end
    
    it "assigns instance to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end
  
  describe "PUT #update" do
    it "updates sponsored_post attributes appropriately" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = rand(25..100)
      
      put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: { title: new_title, body: new_body, price: new_price }
      
      updated_post = assigns(:sponsored_post)
      
      expect(updated_post.id).to eq my_sponsored_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
      expect(updated_post.price).to eq new_price
    end
    
    it "redirects to updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = rand(25..100)
      
      put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: { title: new_title, body: new_body, price: new_price }
      
      expect(response).to redirect_to [my_topic, my_sponsored_post]
    end
  end

end
