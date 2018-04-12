class BandsController < ApplicationController
  before_action :can_see_bands?

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if Band.exists?(name: band_params[:name])
      flash.now[:errors] = ["Band already exits"]
      render :edit
    else
      @band.update(band_params)
      redirect_to band_url(@band)
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:bands).permit(:name)
  end
end
