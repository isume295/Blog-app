class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(post: @post, author: @user)
    if @like.save
      # Like successfully created
    end
    redirect_to user_post_path(@user, @post)
  end
end
