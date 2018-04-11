class SessionsController < ApplicationController
  before_action :ensure_logged_in, only: [:create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )
    if @user
      @user.reset_sesssion_token!
      session[:session_token] = @user.session_token
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    current_user.reset_sesssion_token! if current_user
    session[:session_token] = nil
    render :new
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
