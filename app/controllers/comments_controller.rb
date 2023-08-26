class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.author = @user

    if @comment.save
      flash[:notice] = 'Comment created successfully.'
      redirect_to user_post_path(@user, @post)
    else
      render 'new'
    end
  end

  private

  def set_user_and_post
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
