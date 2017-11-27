class Admin::RestaurantsController < ApplicationController
  #在 before_action呼叫驗證方法
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    
  end

end
