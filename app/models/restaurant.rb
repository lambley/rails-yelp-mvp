class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian].freeze

  has_many :reviews, dependent: :destroy
  validates_presence_of :name, :address
  validates :category, inclusion: CATEGORIES
end
