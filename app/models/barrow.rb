class Barrow < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :name, presence: true
  validates :category, inclusion: { in: ["Manuel", "Thermique", "Electrique", "Assistant"] }
  validates :price, numericality: { only_integer: true }
end
