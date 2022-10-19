class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :see_other
    end
  end

  def edit
    @edit_review = Review.find(params[:id])
  end

  def update
    @edit_review = Review.find(params[:id])
    @edit_review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id])
    @edit_review.destroy
    redirect_to reviews_path
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
