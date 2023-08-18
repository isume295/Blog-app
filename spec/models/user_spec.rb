require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Sumeya') }

  before { subject.save }

  describe 'validation tests' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_count should be a non-negative integer' do
      subject.posts_count = -1
      expect(subject).to_not be_valid

      subject.posts_count = 0
      expect(subject).to be_valid

      subject.posts_count = 2.5
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts' do
      # Arrange
      user = User.create(name: 'Sumeya', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      post1 = Post.create(title: 'post1', author: user, likes_count: 0, comments_count: 0, created_at: 4.day.ago)
      post2 = Post.create(title: 'post2', author: user, likes_count: 0, comments_count: 0, created_at: 3.day.ago)
      post3 = Post.create(title: 'post3', author: user, likes_count: 0, comments_count: 0, created_at: 2.day.ago)

      # Act
      posts = user.recent_posts

      # Assert
      expect(posts).to eq([post3, post2, post1])
    end
  end
end
