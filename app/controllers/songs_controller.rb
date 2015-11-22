class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @users = User.all
  end

  def create
    Song.create(song_params[:song])
    redirect_to "/songs"
  end

  private

  def song_params
    params.permit(song:[:name, :artist, :comments, :user_id])
  end
end
