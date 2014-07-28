  class Movie


  attr_accessor :title
  attr_reader :rank


  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    #puts "Creates a movie object with title #{title} and rank #{rank}"
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  #overrides default to_s
  def to_s
    "#{@title} has a rank of #{@rank}"
  end


end

class Playlist
  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play
    puts "#{@name}'s playlist:'"
    puts @movies

    @movies.each do |movie|
      movie.thumbs_up
      puts movie
    end
  end

end

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