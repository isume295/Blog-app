class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find_by(id: @user_id)
    # @recent_comments = @posts.recent_comments
    # Placeholder action for the 'users/:user_id/posts' URL
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    @post = Post.find_by(id: @post_id)
    # Placeholder action for the 'users/:user_id/posts/:id' URL
  end
end
