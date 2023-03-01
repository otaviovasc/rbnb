class AccommodationsController < ApplicationController
  def index
    @accommodations = Accommodation.all
  end
end
