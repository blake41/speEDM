class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    # Access private data
    spotify_user.country #=> "US"
    spotify_user.email   #=> "example@email.com"

    # Create playlist in user's Spotify account
    playlist = spotify_user.create_playlist!('my-awesome-playlist')

    # Add tracks to a playlist in user's Spotify account
    tracks = RSpotify::Track.search('Know')
    playlist.add_tracks!(tracks)
    playlist.tracks.first.name #=> "Somebody That I Used To Know"

    # Access and modify user's music library
    spotify_user.save_tracks!(tracks)
    spotify_user.saved_tracks.size #=> 20
    spotify_user.remove_tracks!(tracks)

    # Use Spotify Follow features
    spotify_user.follow(playlist)
    # spotify_user.follows?(artists)
    # spotify_user.unfollow(users)
    redirect_to root_url
    # Check doc for more
  end
end
