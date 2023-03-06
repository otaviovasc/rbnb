class RentalsController < ApplicationController
  before_action :set_accommodation, only: %i[new create]

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if available?(@accommodation, @rental)
      @rental.accommodation = @accommodation
      @rental.user = current_user
      @rental.total_price = @accommodation.price * (@rental.end_date - @rental.start_date) if !@rental.end_date.nil? && !@rental.start_date.nil?
      if @rental.save
        redirect_to bookings_rentals_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_accommodation_rental_path(@accommodation), notice: "This date is not available."
    end
  end

  def bookings
    @bookings = Rental.where(user_id: current_user)
  end

  def destroy
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

  def available?(accommodation, rental)
    new_rental_range = rental.start_date..rental.end_date
    acc_rentals = Rental.where(accommodation_id: accommodation)
    acc_rentals.each do |acc_rental|
      rental_range = acc_rental[:start_date]..acc_rental[:end_date]
      if new_rental_range.overlaps?(rental_range)
        return false
      end
    end
    return true
  end
end
