require 'rails_helper'

RSpec.describe 'user show view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://images3.alphacoders.com/690/690494.jpg',
      bio: 'test_bio1',
      posts_count: 1
    )
  end

  let!(:posts) do
    [
      Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_count: 1, likes_count: 1),
      Post.create(author: user1, title: 'Post 2', text: 'Post 2 content', comments_count: 2, likes_count: 2),
      Post.create(author: user1, title: 'Post 3', text: 'Post 3 content', comments_count: 3, likes_count: 3)
    ]
  end

  describe 'show user and post details' do
    before(:example) do
      visit user_path(user1)
    end

    it 'displays user information' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.posts_count)
      expect(page).to have_content(user1.bio)
      expect(page).to have_selector("img[src='#{user1.photo}']")
    end

    it 'displays user\'s first 3 posts' do
      posts.take(3).each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it 'redirects to user\'s posts index page when clicking to see all posts' do
      click_link('see all posts')
      expect(page).to have_current_path(user_posts_path(user1))
    end
  end
end
