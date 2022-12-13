class User < ApplicationRecord
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :name, presence: true

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
