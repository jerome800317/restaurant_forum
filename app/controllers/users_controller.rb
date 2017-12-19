class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    if @User.update(user_params)
      flash[:notice] = "user was successfully updated"
      redirect_to user_path
    else
      flash.now[:alert] = "user was failed to update, you need to check your name's column"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :image)
  end
end
