require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'renders the index template' do
      user = User.create(name: 'Sumeya', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('User Posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'renders the show template' do
      user = User.create(name: 'Sumeya', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
      post = Post.create(title: 'post1', author: user, likes_count: 0, comments_count: 0, created_at: 5.day.ago)
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('User Posts')
    end
  end
end
