require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.new(author: @author, title: 'Post communication', text: 'This is my first post')
    @comment = Comment.new(author: @author, post: @post, text: 'This is a comment')
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

  context 'Comment methods' do
    it 'modify comment counter' do
      expect(@comment.comments_counter).to eq 1
    end
  end
end