class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @review.restaurant = @restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @edit_restaurant = Restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @edit_restaurant.destroy
    redirect_to restaurants_path
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
