class UsersController < ApplicationController
  def signin
    @users = User.all
  end
end
