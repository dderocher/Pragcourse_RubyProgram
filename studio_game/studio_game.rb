

current_time = Time.new

puts " \n #{current_time.strftime("The Game Started on %m/%d/%Y at %I:%M%p ")} \n\n"


player1 = 'larry'
player1_health = 60

player2 = 'curly'
player2_health = 125

player3 = 'moe'
player3_health = 100

player4 = 'shemp'
player4_health = 90


player2_health = player1_health
player1_health = 30

puts " #{player1.capitalize}'s health is #{player1_health}"
puts " #{player2.upcase}'s health is #{player2_health}"
puts " #{player3.capitalize}'s health is #{player3_health} ".center(60,'*' )

puts " #{player4.upcase.ljust(40, '.' )} health is #{player4_health}"

puts " Players:\n\t #{player1}\n\t #{player2}\n\t #{ player3}"


