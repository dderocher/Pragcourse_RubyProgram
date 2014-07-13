
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
=end


movie = "ghostbusters"
title = movie.capitalize
title.ljust(30,'.')
puts "\n#{title}"

#can also say...
title = movie.capitalize.ljust(30,'.')

rank = 9

puts "#{title} #{rank}"

