class Song < ActiveRecord::Base
#attr_accessor :name, :artist

  belongs_to :user

  validates :name, presence: true
  # validates :name, length: { minimum: 3}
  validates :artist, presence: true
  # validates :artist, length: { minimum: 3 }
  validates :song_url, presence: true

  validates_url_format_of :song_url, :message => "is not a valid URL"

  validates_format_of :song_url, with: /watch\?v=(.*?)(?:&feature|\Z)/, :message => "does not seem to be a Youtube link"


end
