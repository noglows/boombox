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

  def new
    @user = User.new
    @action = "create"
  end

  def create
    User.create(user_params[:user])
    new_name = user_params[:user][:name]
    user = User.where(name: new_name)
    session[:user_id] = user[0].id
    redirect_to "/songs"
  end

  private

  def user_params
    params.permit(user:[:id, :name, :fav_genres])
  end
end
