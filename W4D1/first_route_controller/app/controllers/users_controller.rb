class UsersController < ApplicationController

  def index
    users = User.all
    render json: params[:user_id]
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to users_url
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user
      user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
