class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :activate, :deactivate]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render j
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def activate
    update_activation_status(true)
  end

  def deactivate
    update_activation_status(false)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # Assuming `active` is the correct field name in your model for activation status
    params.require(:user).permit(:name, :email, :active)
  end

  def update_activation_status(status)
    if @user.update(active: status)
      render json: { message: "User #{status ? 'activated' : 'deactivated'} successfully." }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
