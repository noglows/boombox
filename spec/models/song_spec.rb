require 'rails_helper'

RSpec.describe Song, type: :model do
  it_behaves_like "a medium"

  describe "model validations" do
    it "must have a URL" do
      song = Song.new(name: "Test Song", artist: "Test Artist")
      expect(song).to be_invalid
    end

    it "must have an artist" do
      song = Song.new(name: "Test Song", song_url:"https://www.youtube.com/watch?v=vVvlzX6Ko2s")
      expect(song).to be_invalid
    end

    it "must have a Youtube link as the URL" do
      song = Song.new(name: "Test Song", artist: "Test Artist", song_url:"http://stackoverflow.com/questions/1711/what-is-the-single-most-influential-book-every-programmer-should-read/")
      expect(song).to be_invalid
    end

    it "must have a Youtube link as the URL" do
      song = Song.new(name: "Test Song", artist: "Test Artist", song_url:"https://www.youtube.com/watch?v=vVvlzX6Ko2s")
      expect(song).to be_valid
    end
  end
end
