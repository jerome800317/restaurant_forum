class Admin::RestaurantsController < ApplicationController
  #在 before_action呼叫驗證方法
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create, you need to add colume of name"
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurant_path
    else
      flash.now[:alert] = "restaurant was failed to create, you need to add colume of name"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    flash[:alert] = "restaurant was deleted"
    redirect_to admin_restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
