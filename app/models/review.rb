class Review < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :content
  validates :rating, numericality: { only_integer: true, in: (0..5) }

  def self.max_review_rating
    # get max value from validors[:options] :in validator
    # [#<ActiveRecord::Validations::NumericalityValidator:0x00007fcc3887c268 @attributes=[:rating], @options={:only_integer=>true, :in=>0..5}>]
    validators_on(:rating).select.first.options[:in].last
  end
end
