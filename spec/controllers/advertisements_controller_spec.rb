require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let (:my_advertisement) { Advertisement.create({ title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..100) }) }
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: my_advertisement.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, { id: my_advertisement.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates new advertisement object" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

end
