class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, comparison: { greater_than: :start_date }
end
