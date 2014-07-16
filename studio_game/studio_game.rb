
class Player

  #The initialize method is a special "constructor" method. You never call it directly.
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health}."
  end

  def blam
    @health -= 10
    puts "#{@name} got Blammed!"
  end

  def w00t
    @health += 15
   puts  "#{@name} got w00ted!"
  end
end


current_time = Time.new
puts " \n #{current_time.strftime("The Game Started on %m/%d/%Y at %I:%M%p ")} \n\n"


player1 = Player.new("larry")
puts player1
#puts player1.inspect

player2 = Player.new("curly",125)
puts player2

player3 = Player.new("moe")
puts player3

 player1.blam
puts player1







=begin
def time
  current_time = Time.new

  return current_time.strftime("%I:%M:%S%p")
end

def say_hello(name,health=0)
  return "I'm #{name.capitalize} with a health of #{health} as of #{time}."
end


current_time = Time.new

puts " \n #{current_time.strftime("The Game Started on %m/%d/%Y at %I:%M%p ")} \n\n"




puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)
=end





=begin
-------------------------------------
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

--------------------------------------------------------

=end
