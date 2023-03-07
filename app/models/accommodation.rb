class Accommodation < ApplicationRecord
  PLANETS = %w[Mecury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto]

  belongs_to :user
  has_many_attached :photos
  has_many :rentals, dependent: :destroy

  validates :category, inclusion: { in: PLANETS }
  validates :photos, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_category,
    against: [ :title, :category, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
