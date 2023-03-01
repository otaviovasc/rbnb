class AccommodationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodations_params)
    @user = current_user
    @accommodation.user = @user
    if @accommodation.save
      redirect_to @accommodation
    else
      render new_accommodation_path, status: :unprocessable_entity
    end
  end

  private

  def accommodations_params
    params.require(:accommodation).permit(:title, :address, :price, :category, :description)
  end
end
