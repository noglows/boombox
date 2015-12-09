require 'rspotify'

class UsersController < ApplicationController

  def spotify
    # spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    user = User.where(name: @spotify_user.id)
    if user.empty?
      User.create(name: @spotify_user.id)
      session[:user_id] = User.last.id
    else
      session[:user_id] = user.id
    end
    # Now you can access user's private data, create playlists and much more

    # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"
    #
    # # Create playlist in user's Spotify account
    # playlist = spotify_user.create_playlist!('my-awesome-playlist')
    #
    # # Add tracks to a playlist in user's Spotify account
    # tracks = RSpotify::Track.search('Know')
    # playlist.add_tracks!(tracks)
    # playlist.tracks.first.name #=> "Somebody That I Used To Know"
    #
    # # Access and modify user's music library
    # spotify_user.save_tracks!(tracks)
    # spotify_user.saved_tracks.size #=> 20
    # spotify_user.remove_tracks!(tracks)
    #
    # albums = RSpotify::Album.search('launeddas')
    # spotify_user.save_albums!(albums)
    # spotify_user.saved_albums.size #=> 10
    # spotify_user.remove_albums!(albums)
    #
    # # Use Spotify Follow features
    # spotify_user.follow(playlist)
    # spotify_user.follows?(artists)
    # spotify_user.unfollow(users)

    redirect_to root_path
    # Check doc for more
  end


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
    @user = User.new(user_params[:user])
    if @user.save
      session[:user_id] = User.last.id
      redirect_to "/songs"
    else
      @action = "create"
      render "new"
    end
  end

  def show
    @id = params[:id].to_i
    @user_songs = Song.where(user_id: @id).order(votes: :desc)

    @first_song, @song_urls_list = Song.return_user_urls(@id)

    if session[:user_id] != nil
      id = session[:user_id]
      @user = User.find(id)
      @voted_for = @user.voted_for
      if @voted_for != nil
        @voted_for = eval(@voted_for)
      end
    end
  end

  def update
    id = params[:id]
    song_id = params[:song_id]

    song = Song.find(song_id)

    num_votes = song.votes + 1
    song.update(votes: num_votes)

    user = User.find(session[:user_id])
    user.update_voted_for(song_id)
    redirect_to "/users/#{id}"
  end

  def destroy
    id = params[:id]
    song_id = params[:song_id]
    Song.destroy(song_id)
    redirect_to "/users/#{id}"
  end

  def add_user_song
    @action = "user_song_create"
    @song = Song.new
    render "songs/new"
  end

  def user_song_create
    @song = Song.new(song_params[:song])
    if @song.save
      redirect_to "/users/#{session[:user_id]}"
    else
      @action = "create"
      render "new"
    end
  end

  private

  def user_params
    params.permit(user:[:id, :name, :fav_genres])
  end

  def song_params
    params.permit(song:[:id, :name, :artist, :song_url, :user_id, :votes])
  end
end
