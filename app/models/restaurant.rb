class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian].freeze

  has_many :reviews, dependent: :destroy
  validates_presence_of :name, :address
  validates :category, inclusion: CATEGORIES

  def average_rating
    reviews.average('rating').to_f.round(1)
  end
end
