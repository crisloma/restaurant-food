class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: 'Restaurant was successfully created.'
    else
      @restaurants = Restaurant.all
      render :index
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
