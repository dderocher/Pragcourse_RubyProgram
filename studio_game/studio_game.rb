


require_relative 'game'
require_relative 'player'



#puts Math::E

current_time = Time.new
puts " \n #{current_time.strftime("The Game Started on %m/%d/%Y at %I:%M%p ")} \n\n"


knuckleheads = Game.new('knuckleheads')

knuckleheads.add_player( Player.new('moe'))
knuckleheads.add_player( Player.new('larry',60))
knuckleheads.add_player(Player.new('curly',125))

knuckleheads.play

puts knuckleheads.title

=begin
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
=end

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



