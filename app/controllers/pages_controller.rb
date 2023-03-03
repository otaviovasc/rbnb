class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @accommodations = Accommodation.all.sample(3)
  end
end
