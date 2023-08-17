class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # Attributes: id, user_id, post_id, updated_at, created_at

  # Callbacks
  after_save :update_post_likes_counter

  # Methods
  private

  def update_post_likes_counter
    post.update(likes_count: post.likes.count)
  end
end
