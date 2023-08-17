class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: 'author_id'

  # attribute
  attribute :name, :string
  attribute :bio, :text
  attribute :posts_count, :integer, default: 0
  attribute :photo, :string

  # method
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end