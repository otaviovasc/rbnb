class RentalsController < ApplicationController
  before_action :set_accommodation, only: %i[new create]

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.accommodation = @accommodation
    @rental.user = current_user
    if !@rental.end_date.nil? && !@rental.start_date.nil?
      @rental.total_price = @accommodation.price * (@rental.end_date - @rental.start_date)
    end
    authorize @rental
    if @rental.save
      # REDIRECT TO My_Rentals when we have it
      redirect_to bookings_rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def bookings
    @bookings = Rental.where(user_id: current_user)
  end

  def destroy
    authorize @rental
    @booking = Rental.find(params[:id])
    @booking.destroy
    redirect_to bookings_rentals_path, notice: "Your booking was canceled successfully."
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
