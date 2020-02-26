class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :barrow
  validates :booking_date, presence: true
end
