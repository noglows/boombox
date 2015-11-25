class SongsController < ApplicationController
  def index
    @songs = Song.order(votes: :desc)
    if session[:user_id] != nil
      id = session[:user_id]
      @user = User.find(id)
      @voted_for = @user.voted_for
      @voted_for = eval(@voted_for)
      # if @voted_for != nil
      #   @voted_for = @voted_for.split(",")
      #   @voted_for[0] = @voted_for[0].tr("[", "")
      #   @voted_for[-1] = @voted_for[-1].tr("]", "")
      # end
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
      #array.split!
      #binding.pry
      #votes = votes.split(",")
      #binding.pry
      #votes.each do |vote|
      #  vote.delete!'[]'
      #  vote.delete!'\"'
      #  binding.pry
      #  vote.strip!
      #end
      #votes[0] = votes[0].tr("[", "")
      #binding.pry
      #votes[-1] = votes[-1].tr("]", "")
      #binding.pry
      array.push(id.to_i)
      array.each do |vote|
        vote = vote.to_i
      end
      binding.pry
      user.update(voted_for: array)
      binding.pry
    end


    redirect_to "/songs"
  end

  private

  def song_params
    params.permit(song:[:name, :artist, :comments, :user_id])
  end
end
