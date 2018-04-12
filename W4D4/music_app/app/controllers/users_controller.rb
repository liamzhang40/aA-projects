class UsersController < ApplicationController
  before_action :can_register?, only: [:new]

  def show
    user = User.find(params[:id])
    render plain: "#{user.email}"
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
