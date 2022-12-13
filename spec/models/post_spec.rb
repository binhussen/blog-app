require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @author, title: 'Post communication', text: 'This is my first post')
  end

  context 'check Validations' do
    it 'checks if title is empty' do
      post = Post.new(author: @author, text: 'This is my first post')
      expect(post.valid?).to eq false
    end
    it 'checks if text is empty' do
      post = Post.new(author: @author, title: 'Post communication')
      expect(post.valid?).to eq false
    end
    it 'checks if title is less than 10 characters' do
      post = Post.new(author: @author, title: 'Post', text: 'This is my first post')
      expect(post.valid?).to eq true
    end
  end

  context 'Post methods' do
    it 'check recent comments' do
      3.times { Comment.create(author: @author, post: @post, text: 'This is a comment') }
      expect(@post.recent_comments).to match_array @post.comments.last(3)
    end

    it 'check post counter' do
      expect(@author.posts_counter).to eq 1
    end
  end
end
