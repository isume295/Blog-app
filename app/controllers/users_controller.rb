class UsersController < ApplicationController
  def index
    @users = User.all # Assuming you have a User model
    # Additional logic if needed
  end

  def show
    @user_id = params[:id]
    @user = User.find_by(id: @user_id)
    @recent_posts = @user.recent_posts
    # Placeholder action for the 'users/:id' URL
  end
end
