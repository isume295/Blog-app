class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # Attributes: id, user_id, post_id, text, updated_at, created_at

  # Callbacks
  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter


  def update_post_comments_counter
    post.update(comments_count: post.comments.count)
  end
end
