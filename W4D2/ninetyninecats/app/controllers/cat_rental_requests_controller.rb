class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def create
    rental = CatRentalRequest.new(request_params)
    if rental.save
      redirect_to cats_url
    else
      flash[:errors] = rental.errors.full_messages
      redirect_to new_cat_rental_request_url
    end
  end

  # def update
  #   rental = CatRentalRequest.find(params[:id])
  #
  #   if params[:status] == 'APPROVED'
  #     rental.approve!
  #   elsif params[:status] == 'DENIED'
  #     rental.deny!
  #   end
  # end

  def approve
    rental = CatRentalRequest.find(params[:id])
    rental.approve!

    redirect_to cat_url(rental.cat_id)
  end

  def deny
    rental = CatRentalRequest.find(params[:id])
    rental.deny!

    redirect_to cat_url(rental.cat_id)
  end

  private
  def request_params
    params.require(:requests).permit(:cat_id, :start_date, :end_date)
  end
end
