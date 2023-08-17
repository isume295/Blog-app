class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Attributes: id, author_id, title, text, updated_at, created_at, comments_count, likes_count

  # callback
  after_save :update_user_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_user_posts_counter
    author.update(posts_count: author.posts.count)
  end
end
