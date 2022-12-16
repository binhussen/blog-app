require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  describe '/index' do
    it 'check http success' do
      User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    it 'Check render index' do
      User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)
      get '/'
      expect(response).to render_template(:index)
    end

    it 'Check the placeholder' do
      User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  posts_counter: 0)
      get '/'
      expect(response.body).to include('Users')
    end
  end

  describe '/show' do
    before :each do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      get "/users/#{@author.id}"
    end

    it 'Check http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Check render show' do
      expect(response).to render_template(:show)
    end

    it 'Check the placeholder' do
      expect(response.body).to include('User')
    end
  end
end
