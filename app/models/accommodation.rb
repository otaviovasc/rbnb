class Accommodation < ApplicationRecord
  PLANETS = %w[Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto]
  CATEGORIES = %w[Flat Spaceship House Bunker Cave]

  belongs_to :user
  has_many_attached :photos
  has_many :rentals, dependent: :destroy

  validates :planet, inclusion: { in: PLANETS }
  validates :category, inclusion: { in: CATEGORIES }

  validates :photos, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_category,
    against: [ :title, :category, :address, :description, :planet ],
    using: {
      tsearch: { prefix: true }
    }
end
