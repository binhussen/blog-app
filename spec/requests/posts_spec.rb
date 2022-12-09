require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe '/index' do
    before :each do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      get "/users/#{@author.id}/posts"
    end

    it 'Check http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'check render index' do
      expect(response).to render_template(:index)
    end

    it 'Check the placeholder' do
      expect(response.body).to include('posts by user')
    end
  end

  describe '/show' do
    before :each do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(author: @author, title: 'Post communication', text: 'This is my first post')
      get "/users/#{@author.id}/posts/#{@post.id}"
    end

    it 'Check http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Check render show' do
      expect(response).to render_template(:show)
    end

    it 'Check the placeholder' do
      expect(response.body).to include('Post')
    end
  end
end
