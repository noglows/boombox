class SongsController < ApplicationController
  def index
    @songs = Song.order(votes: :desc)
    song_urls = []
    @songs.each do |song|
      song.song_url.slice!"https://www.youtube.com/watch?v="
      song_urls.push(song.song_url)
    end
    @first_song = song_urls[0]
    song_urls.delete_at(0)
    @song_urls_list = ""
    song_urls.each do |url|
      @song_urls_list += ","
      @song_urls_list += url
    end
    @song_urls_list.slice!(0)

    if session[:user_id] != nil
      id = session[:user_id]
      @user = User.find(id)
      @voted_for = @user.voted_for
      if @voted_for != nil
        @voted_for = eval(@voted_for)
      end
    end
  end

  def new
    @song = Song.new
    @users = User.all
  end

  def create
    new_params = song_params[:song]
    new_params[:votes] = 0
    new_params[:user_id] = session[:user_id]
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
    user_id = session[:user_id]
    user = User.find(user_id)
    votes = user.voted_for
    if votes == nil
      new_array = []
      new_array.push(id.to_i)
      user.update(voted_for: new_array)
    else
      array = votes
      array = eval(array)
      array.push(id.to_i)
      array.each do |vote|
        vote = vote.to_i
      end
      user.update(voted_for: array)
    end
    redirect_to "/songs"
  end


  private

  def song_params
    params.permit(song:[:name, :artist, :comments, :user_id, :song_url])
  end
end
