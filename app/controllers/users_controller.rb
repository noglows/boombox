class UsersController < ApplicationController
  def signin
    @users = User.all
    @user = User.new
  end

  def signed_in
    new_params = user_params[:user]
    session[:user_id] = new_params[:id]
    redirect_to "/songs"
  end

  def logout
    session.clear
    redirect_to "/songs"
  end

  private

  def user_params
    params.permit(user:[:id, :name, :fav_genres])
  end
end
