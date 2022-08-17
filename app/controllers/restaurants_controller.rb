class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # raise
    @reviews = @restaurant.reviews
  end

  def new #ETAPE 1 of the CREATE from CRUD
    @restaurant = Restaurant.new # not saved yet!
  end

  def create #ETAPE 2 réception des data du form
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
