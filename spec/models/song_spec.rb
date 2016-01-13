require 'rails_helper'

RSpec.describe Song, type: :model do

  # let(:song_valid) { Song.new(user_id: 1, name:"Test Song", artist: "Test Artist", song_url: "https://www.youtube.com/watch?v=68jvPefuDxE")}

  describe ".validates" do

    it "must have a name" do
      a = build(:song, name: nil)
      expect(a).to_not be_valid
      expect(a.errors.keys).to include :name
      expect(build(:song)).to be_valid
    end

    it "must have an artist" do
      a = build(:song, artist: nil)
      expect(a).to_not be_valid
      expect(a.errors.keys).to include :artist
    end

    it "must have a URL" do
      a = build(:song, song_url: nil)
      expect(a).to_not be_valid
      expect(a.errors.keys).to include :song_url
    end

    it "must have a valid url for the song_url" do
      a = build(:song, song_url: "cat")
      expect(a).to_not be_valid
      expect(a.errors.keys).to include :song_url
    end

    it "must have a Youtube url for the song_url" do
      a = build(:song, song_url: "https://rvm.io/gemsets/initial")
      expect(a).to_not be_valid
      expect(a.errors.keys).to include :song_url
    end

    it "must have a user ID" do
      a = build(:song, user_id: nil)
      expect(a).to_not be_valid
      expect(a.errors.keys).to include :user_id
    end
  end


  describe "model methods" do

    it "returns a string of comma seperated URLs" do
      create(:song)
      create(:song_2)
      create(:song_3)
      create(:song_4)
      first_song, song_urls_list = Song.return_urls
      expect(first_song).to eq "68jvPefuDxE"
      expect(song_urls_list).to eq "oaLBxsk9ejo,RF0HhrwIwp0,wPBbMbKSZrQ"
    end

    it "returns a string of comma seperated URLs for a particular user" do
      create(:song)
      create(:song_2)
      create(:song_3)
      create(:song_4)
      first_song, song_urls_list = Song.return_user_urls(1)
      expect(first_song).to eq "68jvPefuDxE"
      expect(song_urls_list).to eq "oaLBxsk9ejo,wPBbMbKSZrQ"

    end

  end

end
