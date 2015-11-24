class User < ActiveRecord::Base


  has_many :songs

  # validates :name, presence: true
  # validates :name, length: { minimum: 3}
end
