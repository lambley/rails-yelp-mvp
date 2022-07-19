class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[index show new create]

  def index
    @reviews = @restaurant.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), alert: 'Review submitted sucessfully'
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
