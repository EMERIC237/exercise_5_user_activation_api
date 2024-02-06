class UserController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def activate
    user = get_user
    user.activate = true
  end

  def deactivate
    user = get_user
    user.activate = false
  end

  def user_params
    params.permit(:name, :email, :active)
  end

  private
  def get_user
    user = User.find(params[:id])
  end
end
