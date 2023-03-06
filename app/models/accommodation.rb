class Accommodation < ApplicationRecord
  PLANETS = %w[Mecury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto]

  belongs_to :user
  has_many_attached :photos
  has_many :rentals, dependent: :destroy
  
  validates :category, inclusion: { in: PLANETS }
  validates :photos, presence: true
end
