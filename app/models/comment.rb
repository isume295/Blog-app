class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  attribute :text, :text

  # Callbacks
  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter

  def update_post_comments_counter
    post.update(comments_count: post.comments.count)
  end
end
