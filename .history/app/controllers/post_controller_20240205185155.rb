class PostController < ApplicationController
  #   Create a posts controller and for when a user is activated, the user can create a post. Otherwise return an error message.

  # For retrieving posts, only return posts from active users.

  # For getting a post by id, only return the post if the user is active otherwise return an error message.
  before_action :set_user, only: [:show, :create, :destroy, :activate, :deactivate]
  def index
  end

  def show
  end

  def create
    if user.activate
      post = Post.create(post_params)
      render json: post
    else
      render error: "you can't create a post if not activated"
    end

  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :active)
  end
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

# efore_action :set_user, only: [:show, :update, :destroy, :activate, :deactivate]

#   def index
#     @users = User.all
#     render json: @users
#   end

#   def show
#     render json: @users
#   end

#   def create
#     @user = User.new(user_params)
#     if @user.save
#       render json: @user, status: :created, location: @user
#     else
#       render json: @user.errors, status: :unprocessable_entity
#     end
#   end

#   def update
#     if @user.update(user_params)
#       render json: @user
#     else
#       render json: @user.errors, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @user.destroy
#     head :no_content
#   end

#   def activate
#     update_activation_status(true)
#   end

#   def deactivate
#     update_activation_status(false)
#   end

#   private

#   def set_user
#     @user = User.find(params[:id])
#   end

#   def user_params
#     # Assuming `active` is the correct field name in your model for activation status
#     params.require(:user).permit(:name, :email, :active)
#   end

#   def update_activation_status(status)
#     if @user.update(active: status)
#       render json: { message: "User #{status ? 'activated' : 'deactivated'} successfully." }
#     else
#       render json: @user.errors, status: :unprocessable_entity
#     end
