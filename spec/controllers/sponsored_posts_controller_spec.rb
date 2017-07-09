require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) {my_topic.sponsored_posts.create!(title:RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer)}
  
  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end
    
    it "assigns my_post to @posts" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template(:new)
    end
    
    it "initializes @topic" do
      get :new, topic_id: my_topic.id
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id:my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the edit view" do
      get :edit, topic_id:my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end
    
    it "assigns post to the updated to @post" do
      get :edit, topic_id:my_topic.id, id: my_sponsored_post.id
      
      sponsored_post_instance = assigns(:sponsored_post)
      
      expect(sponsored_post_instance.id).to eq my_sponsored_post.id
      expect(sponsored_post_instance.title).to eq my_sponsored_post.title
      expect(sponsored_post_instance.body).to eq my_sponsored_post.body
      expect(sponsored_post_instance.price).to eq my_sponsored_post.price
    end
  end
  
  describe "POST create" do
    it "increases number of sponsored posts by 1" do
      expect{ post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer}}.to change(SponsoredPost, :count).by(1)
    end
    
    it "assigns the new sponsored post to @SponsoredPost" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end
    
    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_integer}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end
  
  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id:my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the edit view" do
      get :edit, topic_id:my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end
    
    it "assigns post to the updated to @post" do
      get :edit, topic_id:my_topic.id, id: my_sponsored_post.id
      
      sponsored_post_instance = assigns(:sponsored_post)
      
      expect(sponsored_post_instance.id).to eq my_sponsored_post.id
      expect(sponsored_post_instance.title).to eq my_sponsored_post.title
      expect(sponsored_post_instance.body).to eq my_sponsored_post.body
      expect(sponsored_post_instance.price).to eq my_sponsored_post.price
    end
  end
end
