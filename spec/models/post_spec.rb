require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'The new way') }

  before { subject.save }

  describe 'validation tests' do
    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'comments_count and likes_count should be a non-negative integer' do
      subject.comments_count = -1
      subject.likes_count = -1
      expect(subject).to_not be_valid
    end
  end

  describe '#recent_comments' do
    it 'returns the 5 most recent comments' do
      # Arrange
      user = User.create(name: 'Sumeya', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      post1 = Post.create(title: 'post1', author: user, likes_count: 0, comments_count: 0, created_at: 5.day.ago)
      comment1 = Comment.create(post: post1, author: user, text: 'Hi Tom!', created_at: 4.day.ago)
      comment2 = Comment.create(post: post1, author: user, text: 'Hi Tom!', created_at: 3.day.ago)
      comment3 = Comment.create(post: post1, author: user, text: 'Hi Tom!', created_at: 2.day.ago)
      comment4 = Comment.create(post: post1, author: user, text: 'Hi Tom!', created_at: 1.day.ago)
      comment5 = Comment.create(post: post1, author: user, text: 'Hi Tom!', created_at: 1.day.ago)

      # Act
      comments = post1.recent_comments

      # Assert
      expect(comments).to eq([comment5, comment4, comment3, comment2, comment1])
    end
  end

  describe '#update_user_posts_counter' do
    it 'returns the 5 most recent comments' do
      # Arrange
      user = User.create(name: 'Renim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      post1 = Post.create(title: 'post1', author: user, likes_count: 0, comments_count: 0, created_at: 5.day.ago)

      # Act
      post1.update_user_posts_counter

      # Assert
      expect(user.posts_count).to eq(1)
    end
  end
end
