class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'

  # Attributes: id, name, photo, bio, updated_at, created_at, posts_count

  # method
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
