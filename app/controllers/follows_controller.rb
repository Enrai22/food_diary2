class FollowsController < ApplicationController

  def create
    @follow = Follow.new(user_id: @current_user.id, follow_user_id: params[:follow_user_id])
    @follow.save
    redirect_to("/users/#{params[:user_id]}")
  end

  def destroy
    @follow = Follow.find_by(user_id: @current_user.id, follow_user_id: params[:follow_user_id])
    @follow.destroy
    redirect_to("/users/#{params[:user_id]}")

  end

end
