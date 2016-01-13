FactoryGirl.define do
  factory :song do
    user_id 1
    name "Test Song"
    artist "Test Artist"
    song_url "https://www.youtube.com/watch?v=68jvPefuDxE"
  end

  factory :song_2, class: Song do
    user_id 1
    name "Test Song"
    artist "Test Artist"
    song_url "https://www.youtube.com/watch?v=oaLBxsk9ejo"
  end

  factory :song_3, class: Song do
    user_id 2
    name "Test Song"
    artist "Test Artist"
    song_url "https://www.youtube.com/watch?v=RF0HhrwIwp0"
  end

  factory :song_4, class: Song do
    user_id 1
    name "Test Song"
    artist "Test Artist"
    song_url "https://www.youtube.com/watch?v=wPBbMbKSZrQ"
  end
end
