class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'

  # Attributes: id, name, photo, bio, updated_at, created_at, posts_count

  # Validations
  validates :name, presence: true
  validates :posts_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # method
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
