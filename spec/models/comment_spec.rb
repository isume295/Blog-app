require 'rails_helper'
require 'spec_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_comments_counter' do
    it 'adds 1 comment' do
      # Arrange
      user = User.create(name: 'Renim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      post1 = Post.create(title: 'post1', author: user, likes_count: 0, comments_count: 0, created_at: 5.day.ago)
      comment1 = Comment.create(post: post1, author: user, text: 'hi renim')

      # Act
      comment1.update_post_comments_counter

      # Assert
      expect(post1.comments_count).to eq(1)
    end
  end
end
