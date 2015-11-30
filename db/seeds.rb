# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_songs = [
  {name: "Mistakes Like This", artist: "Prelow", votes: 0, user_id: 1, song_url: "https://www.youtube.com/watch?v=VjRb3RjqncQ"},
  {name: "Classic", artist: "The Knocks", votes: 0, user_id: 1, song_url: "https://www.youtube.com/watch?v=emOKaGi8u5U"},
  {name: "2AM", artist: "Astrid S", votes: 0, user_id: 1, song_url: "https://www.youtube.com/watch?v=7MJDQMjYCaI"},
  {name: "Flashed Junk Mind", artist: "Milky Chance", votes: 0, user_id: 1, song_url: "https://www.youtube.com/watch?v=r8BsuT0PWdI"},
  {name: "Por Fin De Encontre", artist: "Juan Magan", votes: 0, user_id: 2, song_url: "https://www.youtube.com/watch?v=_kxz7WX4mLU"},
  {name: "I Choose U", artist: "Timeflies", votes: 0, user_id: 2, song_url: "https://www.youtube.com/watch?v=68jvPefuDxE"},
  {name: "Who Let the Dogs Out", artist: "Bahamen", votes: 0, user_id: 3, song_url: "https://www.youtube.com/watch?v=Qkuu0Lwb5EM"}

]

sample_users = [
  {name: "Jessica", fav_genres: "rap"},
  {name: "Lolita", fav_genres: "reggaeton"},
  {name: "Kepler"}
]

sample_songs.each do |song|
  Song.create(song)
end

sample_users.each do |user|
  User.create(user)
end
