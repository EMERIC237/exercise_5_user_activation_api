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
    user

  end

  def deactivate
  end

  def user_params
    params.permit(:name, :email, :active)
  end

end
