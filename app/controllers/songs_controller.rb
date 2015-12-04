class SongsController < ApplicationController
  def index
    @songs = Song.order(votes: :desc)
    @first_song, @song_urls_list = Song.return_urls

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
    @action = "create"
  end

  def create
    @song = Song.new(song_params[:song])
    if @song.save
      redirect_to "/songs"
    else
      @action = "create"
      render "new"
    end
  end

  def destroy
    id = params[:id]
    Song.destroy(id)
    redirect_to "/songs"
  end

  def update
    id = params[:id]
    song = Song.find(id)
    # increment the number of votes for the song and update the record
    num_votes = song.votes + 1
    song.update(votes: num_votes)

    # Find the current user and add the voted song to their "voted_for" record
    user_id = session[:user_id]
    user = User.find(user_id)
    user.update_voted_for(id)
    
    redirect_to "/songs"
  end


  private

  def song_params
    params.permit(song:[:name, :artist, :comments, :user_id, :votes, :song_url])
  end
end
