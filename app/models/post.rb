class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Attributes: id, author_id, title, text, updated_at, created_at, comments_count, likes_count

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # callback
  after_save :update_user_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_user_posts_counter
    author.update(posts_count: author.posts.count)
  end
end
