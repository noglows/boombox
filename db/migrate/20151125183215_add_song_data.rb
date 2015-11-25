class AddSongData < ActiveRecord::Migration
  def change
    add_column :songs, :song_url, :string
    add_column :songs, :url_duration, :string
  end
end
