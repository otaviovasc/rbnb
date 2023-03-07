class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_accommodation, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @accommodations = policy_scope(Accommodation).search_by_title_and_category(params[:query])
    else
      @accommodations = policy_scope(Accommodation)
    end
  end

  def new
    @accommodation = Accommodation.new
    authorize @accommodation
  end

  def create
    @accommodation = Accommodation.new(accommodations_params)
    @accommodation.user = current_user
    authorize @accommodation

    if @accommodation.save
      redirect_to @accommodation, notice: "Accomodation was successfully updated."
    else
      render new_accommodation_path, status: :unprocessable_entity
    end
  end

  def edit
    authorize @accommodation
  end

  def update
    authorize @accommodation
    if @accommodation.update(accommodations_params)
      redirect_to accommodation_path(@accommodation), notice: "Accomodation was successfully updated."

    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @accommodation
    @accommodation.destroy
    redirect_to my_accommodations_accommodations_url, notice: "Accommodation was successfully destroyed."
  end

  def show
    @rental = Rental.new
    authorize @accommodation
  end

  def my_accommodations
    @accommodations = policy_scope(Accommodation).where(user_id: current_user)
  end

  private

  def accommodations_params
    params.require(:accommodation).permit(:title, :address, :planet, :price, :category, :description, photos: [])
  end

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end
end
