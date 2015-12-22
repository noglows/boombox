require 'rails_helper'

RSpec.describe Song, type: :model do

  let(:song_valid) { Song.new(user_id: 1, name:"Test Song", artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=68jvPefuDxE")}

  describe ".validates" do

    it "must have a name" do
      song = Song.new(user_id: 1, artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=68jvPefuDxE")
      expect(song).to_not be_valid
      expect(song.errors.keys).to include :name
      expect(song_valid).to be_valid
    end

    it "must have an artist" do
      song = Song.new(user_id: 1, name: "Test", song_url: "https://www.youtube.com/watch?v=68jvPefuDxE")
      expect(song).to_not be_valid
      expect(song.errors.keys).to include :artist
    end

    it "must have a URL" do
      song = Song.new(user_id: 1, name: "Test", artist: "Test Artist")
      expect(song).to_not be_valid
      expect(song.errors.keys).to include :song_url
    end

    it "must have a valid url for the song_url" do
      song = Song.new(user_id: 1, name: "Test", artist: "Test Artist", song_url: "cat")
      expect(song).to_not be_valid
      expect(song.errors.keys).to include :song_url
    end

    it "must have a Youtube url for the song_url" do
      song = Song.new(user_id: 1, name: "Test", artist: "Test Artist", song_url: "https://rvm.io/gemsets/initial")
      expect(song).to_not be_valid
      expect(song.errors.keys).to include :song_url
    end

    it "must have a user ID" do
      song = Song.new(name:"Test Song", artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=68jvPefuDxE")
      expect(song).to_not be_valid
      expect(song.errors.keys).to include :user_id
    end
  end


  describe "model methods" do

    let(:song_valid_2) { Song.create(user_id: 1, name:"Test Song", artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=oaLBxsk9ejo")}

    let(:song_valid_3) { Song.create(user_id: 2, name:"Test Song", artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=RF0HhrwIwp0")}

    let(:song_valid_4) { Song.create(user_id: 1, name:"Test Song", artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=wPBbMbKSZrQ")}

    it "returns a string of comma seperated URLs" do
      song = song_valid
      song.save
      song_valid_2
      song_valid_3
      first_song, song_urls_list = Song.return_urls
      expect(first_song).to eq "68jvPefuDxE"
      expect(song_urls_list).to eq "oaLBxsk9ejo,RF0HhrwIwp0"
    end

    it "returns a string of comma seperated URLs for a particular user" do
      song = song_valid
      song.save
      song_valid_2
      song_valid_3
      song_valid_4
      first_song, song_urls_list = Song.return_user_urls(1)
      expect(first_song).to eq "68jvPefuDxE"
      expect(song_urls_list).to eq "oaLBxsk9ejo,wPBbMbKSZrQ"

    end

  end

end
