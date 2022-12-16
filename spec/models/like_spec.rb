require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:example) do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @author, title: 'Post communication', text: 'This is my first post')
    @like = Like.create(author: @author, post: @post)
  end

  context 'Relationships' do
    it '' do
      like = Like.reflect_on_association('author')
      expect(like.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      like = Like.reflect_on_association('post')
      expect(like.macro).to eq(:belongs_to)
    end
  end

  context 'like methods' do
    it 'modify like counter' do
      expect(@post.likes_counter).to eq 1
    end
  end
end
