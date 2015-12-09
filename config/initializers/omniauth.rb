require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "d845268671b24ef68638f3c2a06ebbfd", "a586ae236d16472db979de5c2f5f8a4f", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
