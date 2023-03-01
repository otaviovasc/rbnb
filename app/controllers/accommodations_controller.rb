class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @accommodations = Accommodation.all
  end

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
