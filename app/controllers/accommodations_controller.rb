class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_accommodation, only: %i[show]

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

  def show; end

  def my_accommodations
    @accommodations = Accommodation.where(user_id: current_user)
  end

  private

  def accommodations_params
    params.require(:accommodation).permit(:title, :address, :price, :category, :description)
  end

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end
end
