class Accommodation < ApplicationRecord
  PLANETS = %w[Mecury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto]
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo
  validates :category, inclusion: { in: PLANETS }
end
