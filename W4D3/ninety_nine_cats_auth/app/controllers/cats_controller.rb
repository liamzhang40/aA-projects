class CatsController < ApplicationController
  helper_method :verify_owner
  before_action :verify_owner, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id if current_user
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user_cats.find(params[:id])
    if @cat
      render :edit
    else
      redirect_to new_session_url
    end
  end

  def current_user_cats
    current_user.cats if current_user
  end

  def verify_owner
    owned_cats = current_user_cats

    if current_user.nil?
      redirect_to cats_url
    elsif owned_cats.empty?
      redirect_to cats_url
    elsif !(owned_cats.find(params[:id]).user_id == current_user.id)
      redirect_to cats_url
    end
  end

  def update
    # @cat = current_user_cats.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
