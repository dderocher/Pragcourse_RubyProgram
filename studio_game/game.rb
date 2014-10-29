
class Game

  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(a_player)
    @players << a_player
    #also @players.push(a_player)

  end

  def play
    puts "There are #{@players.count} players in the game "
    @players.each do |player|
      puts player
      player.blam
      player.w00t
      puts player
    end

  end

end