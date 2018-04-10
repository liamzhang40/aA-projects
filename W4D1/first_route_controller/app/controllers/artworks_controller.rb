class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])
    artworks = user.artworks + user.shared_artworks
    render json: artworks.uniq #will have dups if a owner shares his or her owned artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      redirect_to artworks_url
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork
      artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    redirect_to artworks_url
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :email)
  end
end
