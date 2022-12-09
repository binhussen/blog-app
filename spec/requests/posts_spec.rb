require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe '/index' do
    before :each do
      get '/users/:user_id/posts/'
    end

    it 'Check http success' do
      get '/posts/index'
      expect(response).to have_http_status(:ok)
    end

    it 'check render index' do
      expect(response).to render_template(:index)
    end

    it 'Check the placeholder' do
      expect(response.body).to include('Here is a list of all posts for given user')
    end
  end

  describe '/show' do
    before :each do
      get '/users/:user_id/posts/:id'
    end

    it 'Check http success' do
      get '/posts/show'
      expect(response).to have_http_status(:ok)
    end

    it 'Check render show' do
      expect(response).to render_template(:show)
    end

    it 'Check the placeholder' do
      expect(response.body).to include('Here is a specific posts for a given user')
    end
  end
end
