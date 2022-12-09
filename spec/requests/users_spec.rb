require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  describe '/index' do
    it 'check http success' do
      get '/users/'
      expect(response).to have_http_status(:ok)
    end

    it 'Check render index' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'Check the placeholder' do
      get '/'
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe '/show' do
    before :each do
      get '/users/:id'
    end

    it 'Check http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Check render show' do
      expect(response).to render_template(:show)
    end

    it 'Check the placeholder' do
      expect(response.body).to include('Here is a User by given id')
    end
  end
end
