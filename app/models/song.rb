class Song < ActiveRecord::Base
#attr_accessor :name, :artist

  belongs_to :user

  # validates :name, presence: true
  # validates :name, length: { minimum: 3}
  # validates :artist, presence: true
  # validates :artist, length: { minimum: 3 }


end
