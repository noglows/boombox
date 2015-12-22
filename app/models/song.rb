class Song < ActiveRecord::Base
#attr_accessor :name, :artist

  belongs_to :user

  validates :name, presence: true
  # validates :name, length: { minimum: 3}
  validates :artist, presence: true
  # validates :artist, length: { minimum: 3 }
  validates :song_url, presence: true
  validates :user_id, presence: true

  validates_url_format_of :song_url, :message => "is not a valid URL"

  validates_format_of :song_url, with: /watch\?v=(.*?)(?:&feature|\Z)/, :message => "does not seem to be a Youtube link"



  def self.return_urls
    # Pull the song list in order of votes
    songs = Song.order(votes: :desc)
    # initialize variables
    song_urls = Array.new
    song_urls_list = String.new
    # For each url, remove everything except the song ID. Push the song id to the song_url array.
    songs.each do |song|
      song.song_url.slice!"https://www.youtube.com/watch?v="
      song.song_url.slice!"https://youtu.be/"
      song_urls.push(song.song_url)
    end
    # Store the first song as a variable
    first_song = song_urls[0]
    # Delete the first song from the array
    song_urls.delete_at(0)
    # For each item in the url array add a comma and the url to the url string
    song_urls.each do |url|
      song_urls_list += ","
      song_urls_list += url
    end
    # delete the leading comma
    song_urls_list.slice!(0)
    # returns the first song id, and a string of comma seperated ids for the other songs
    return first_song, song_urls_list
  end

  def self.return_user_urls(user_id)
    # Pull the song list in order of votes
    songs = Song.where(user_id: user_id).order(votes: :desc)
    # initialize variables
    song_urls = Array.new
    song_urls_list = String.new
    # For each url, remove everything except the song ID. Push the song id to the song_url array.
    songs.each do |song|
      song.song_url.slice!"https://www.youtube.com/watch?v="
      song.song_url.slice!"https://youtu.be/"
      song_urls.push(song.song_url)
    end
    # Store the first song as a variable
    first_song = song_urls[0]
    # Delete the first song from the array
    song_urls.delete_at(0)
    # For each item in the url array add a comma and the url to the url string
    song_urls.each do |url|
      song_urls_list += ","
      song_urls_list += url
    end
    # delete the leading comma
    song_urls_list.slice!(0)
    # returns the first song id, and a string of comma seperated ids for the other songs
    return first_song, song_urls_list
  end



end
