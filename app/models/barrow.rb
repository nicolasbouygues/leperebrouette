class Barrow < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: ['Thermique', 'Manuel', 'Electrique', 'AssistantIncluded', 'Arc-en-ciel'] }
  validates :price, presence: true, numericality: { only_integer: true }

  has_one_attached :photo

  geocoded_by :town
  after_validation :geocode, if: :will_save_change_to_town?
end

