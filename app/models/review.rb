class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }

  # after_destroy :log_destroy_action

  # def log_destroy_action
  #   puts 'Post destroyed'
  # end
end
