class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create destroy]

  def new #ETAPE 1 of the CREATE from CRUD
    @review = Review.new # not saved yet!
  end

  def create #ETAPE 2 réception des data du form
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to restaurant_path(@restaurant), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
