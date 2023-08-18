require 'rails_helper'
require 'spec_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_likes_counter' do
    it 'update likes_count by one' do
      # Arrange
      user = User.create(name: 'Renim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      post1 = Post.create(title: 'post1', author: user, likes_count: 0, comments_count: 0, created_at: 5.day.ago)
      like1 = Like.create(post: post1, author: user)

      # Act
      like1.update_post_likes_counter

      # Assert
      expect(post1.likes_count).to eq(1)
    end
  end
end
