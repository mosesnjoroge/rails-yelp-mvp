class Restaurant < ApplicationRecord
  has_many :reviews
  # reviews dependent: { destroy :reviews }
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian),
    message: "%{value} is not a valid size" }
end
