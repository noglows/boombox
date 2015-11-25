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

  def show
      @id = params[:id]
      @user_songs = Song.where(user_id: @id).order(votes: :desc)

      song_urls = []
      @user_songs.each do |song|
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

  def update
    id = params[:id]
    song_id = params[:song_id]
    song = Song.find(song_id)
    num_votes = song.votes + 1
    song.update(votes: num_votes)
    user = User.find(id)
    votes = user.voted_for
    if votes == nil
      new_array = []
      new_array.push(song_id.to_i)
      user.update(voted_for: new_array)
    else
      array = votes
      array = eval(array)
      array.push(song_id.to_i)
      array.each do |vote|
        vote = vote.to_i
      end
      user.update(voted_for: array)
    end
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
    #@users = User.all
  end

  def user_song_create
    binding.pry
    new_params = song_params[:song]
    user_id = session[:user_id]
    new_params[:votes] = 0
    new_params[:user_id] = session[:user_id]
    Song.create(new_params)
    redirect_to "/users/#{user_id}"
  end

  private

  def user_params
    params.permit(user:[:id, :name, :fav_genres])
  end

  def song_params
    params.permit(song:[:id, :name, :artist, :song_url])
  end
end
