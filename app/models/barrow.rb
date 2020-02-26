class Barrow < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: ['Thermique', 'Manuel', 'Electrique', 'AssistantIncluded', 'Arc-en-ciel'] }
  validates :price, presence: true, numericality: { only_integer: true }

  has_one_attached :photo
end

