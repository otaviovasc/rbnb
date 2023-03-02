class RentalsController < ApplicationController
  before_action :set_accommodation, only: %i[new create]

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.accommodation = @accommodation
    @rental.user = current_user
    @rental.total_price = @accommodation.price * (@rental.end_date - @rental.start_date)
    if @rental.save
      # REDIRECT TO My_Rentals when we have it
      redirect_to @accommodation
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
