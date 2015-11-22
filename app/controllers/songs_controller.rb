class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @users = User.all
  end

  def create
    new_params = song_params[:song]
    new_params[:votes] = 0
    Song.create(new_params)
    redirect_to "/songs"
  end

  def destroy
    id = params[:id]
    Song.destroy(id)
    redirect_to "/songs"
  end

  def update
    id = params[:id]
    song = Song.find(id)
    num_votes = song.votes + 1
    song.update(votes: num_votes)
    redirect_to "/songs"
  end

  private

  def song_params
    params.permit(song:[:name, :artist, :comments, :user_id])
  end
end
