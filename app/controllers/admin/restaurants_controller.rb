class Admin::RestaurantsController < ApplicationController
  #在 before_action呼叫驗證方法
  before_action :authenticate_user!
  before_action :authenticate_admin

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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :desciption)
  end

end
