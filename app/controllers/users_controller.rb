class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update]

  def update
    if current_user.id == @user.id
      if @user.update(user_params)
        flash[:notice] = "user was successfully updated"
        redirect_to user_path
      else
        flash.now[:alert] = "user was failed to update, you need to check your name's column"
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
