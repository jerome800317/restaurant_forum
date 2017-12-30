class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)
    #亦可用以下兩種方法建立favorites資料庫的資料
    #Favorite.create(restaurant: @restaurant, user: current_user)
    #current_user.favorites.create(restaurant: @restaurant
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorite = Favorite.where(restaurant: @restaurant, user: current_user)#由於favorite只在action中使用, 所以慣例不使用實例變數, 然而使用實例變數也不會影響結果
    favorite.destroy_all #due to the data type is array so we add "all" in the end
    redirect_back(fallback_location: root_path)
  end
end
