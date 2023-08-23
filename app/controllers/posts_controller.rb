class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    # Placeholder action for the 'users/:user_id/posts' URL
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    # Placeholder action for the 'users/:user_id/posts/:id' URL
  end
end
