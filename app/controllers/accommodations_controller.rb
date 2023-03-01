class AccommodationsController < ApplicationController
  before_action :authenticate_user!, :set_accommodation, only: %i[show]

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

  def show; end

  end

  private

  def accommodations_params
    params.require(:accommodation).permit(:title, :address, :price, :category, :description)
  end
end

def set_accommodation
  @accommodation = Accommodation.find(params[:id])
end
