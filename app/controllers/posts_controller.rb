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

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      # Post successfully created
      flash[:notice] = 'Post created successfully.'
      redirect_to user_path(current_user)

    else
      # Handle validation errors
      render :new
    end
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
