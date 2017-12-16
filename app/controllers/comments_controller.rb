class CommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_params)
    @comment_user = current_user
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end

  private

  def comment_params
    params.require(:comments).permit(:content)
  end
end
