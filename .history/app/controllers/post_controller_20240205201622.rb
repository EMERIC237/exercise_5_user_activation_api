class PostsController < ApplicationController
  before_action :set_user, only: [:create]

  # Return posts only from active users
  def index
    @posts = Post.joins(:user).where(users: {active: true})
    render json: @posts
  end

  # Show a post if the post's user is active
  def show
    post = Post.find(params[:id])
    if post.user.active?
      render json: post
    else
      render json: { error: "Post is not available" }, status: :forbidden
    end
  end

 
  
  def create
    if @user.active?
      post = @user.posts.create(post_params)
      if post.persisted?
        render json: post, status: :created
      else
        render json: post.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "User is not activated" }, status: :forbidden
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id]) 
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
