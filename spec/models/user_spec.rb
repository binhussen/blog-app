require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'checks if name is empty' do
      user = User.new(photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0,)
      expect(user.valid?).to eq false
    end

    it 'checks if posts_counter is an integer' do
      user = User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 1.7)
      expect(user.valid?).to eq false
    end

    it 'checks if posts_counter is greater than zero' do
      user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: -1)
      expect(user.valid?).to eq false
    end
  end

  context 'user methods' do
    it 'select recent post' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
      3.times { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
      expect(user.recent_posts).to eq user.posts.last(3)
    end
  end
end