class ReviewsController < ApplicationController
  before_action :set_review, only: %i[create]

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'review was successfully created'
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
