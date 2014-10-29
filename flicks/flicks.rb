

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



=begin
movie1 = Movie.new("goonies",10)
movie1.thumbs_up
puts movie1
puts movie1.title


# movie2 = Movie.new("ghostbusters",9)
# movie2.thumbs_down
# puts movie2
# movie3 = Movie.new("goldfinger")
# puts movie3

=end



=begin
def weekday
  current_time = Time.new
  today = current_time.strftime("%A")

  return today
end


def movie_listing(title, rank=0)

   return " #{title.capitalize} has a rank of #{rank} as of #{weekday}. "
end


puts movie_listing("Goonies",10)
puts movie_listing("ghostbusters",7)


a_title = 'goldfinger'
puts movie_listing(a_title)

=end









=begin
puts 'Mikey loves Goonies'

puts 'Mikey\'s favorite movie is Goonies'

movie = 'Goonies'

puts 'Mikey\'s favorite movie is ' + movie

puts "Mikey's favorite movie is \nGoonies"

rank = 10

puts "#{movie} has a rank of #{rank}"


puts "#{movie} has a rank of #{rank * 2} 
      as of #{Time.new}"

puts "#{movie} has a rank of \n#{rank * 2} 
      \nas of #{Time.new}"



movie = "ghostbusters"
title = movie.capitalize
title.ljust(30,'.')
puts "\n#{title}"

#can also say...
title = movie.capitalize.ljust(30,'.')

rank = 9

puts "#{title} #{rank}"

=end