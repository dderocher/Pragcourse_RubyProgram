

#require_relative 'movie'
require_relative 'playlist'

# Interesting This prints the current running program which is flicks.rb
# puts $0


movie1 = Movie.new("goonies",10)
movie2 = Movie.new("ghostbusters",9)
movie3 = Movie.new("goldfinger")

  movies = [movie1,movie2,movie3]

#Need a way to play movies

  playlist1 = Playlist.new("Dave'")
  playlist1.add_movie(movie1)
  playlist1.add_movie(movie2)
  playlist1.add_movie(movie3)
  playlist1.play



