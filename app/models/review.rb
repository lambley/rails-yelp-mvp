class Review < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :content
  validates :rating, numericality: { only_integer: true, in: (0..5) }
end
