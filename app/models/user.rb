class User < ActiveRecord::Base


  has_many :songs

  # validates :name, presence: true
  # validates :name, length: { minimum: 3}
  def update_voted_for(song_id)
    votes = voted_for
    # If the user has not voted for any songs, add the song id to an array and then update the record with the array
    if votes == nil
      new_array = []
      new_array.push(song_id.to_i)
      update(voted_for: new_array)
    # If the user has voted for songs, add the song id and then update the record with the new array
    else
      array = eval(votes)
      array.push(song_id.to_i)
      array.each do |vote|
        vote = vote.to_i
      end
      update(voted_for: array)
    end

  end
end
