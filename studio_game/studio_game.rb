

class Player

  attr_reader :health
  attr_accessor :name


  #The initialize method is a special "constructor" method. You never call it directly.
  def initialize(init_name, init_health=100)
    self.name = init_name
    @health = init_health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end


  def score
    @name.length + health
  end


  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got Blammed!"
  end

  def w00t
    @health += 15
   puts  "#{@name} got w00ted!"
  end

end #class Player


current_time = Time.new
puts " \n #{current_time.strftime("The Game Started on %m/%d/%Y at %I:%M%p ")} \n\n"


players = []
players << Player.new('moe')
players << Player.new('larry',60)
players << Player.new('curly',125)

puts " There are #{players.count} players in the game "

players.each  do |player|
  puts player
end

players.each { |player| puts player.health }


players.pop
players.push(Player.new('shemp',90))

players.each do |player|
  player.blam
  player.w00t
  puts player
end

=begin
player1 = Player.new('moe')
player2 = Player.new('larry',60)
player3 = Player.new('curly',125)


puts player2.name
puts player2.health

player2.name = 'lawrence'
puts player2.name

puts " Score: #{player2.score}"
puts player2
=end



