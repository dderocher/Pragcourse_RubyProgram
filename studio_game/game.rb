require_relative 'die'

class Game

  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
    @die = Die.new
  end

  def add_player(a_player)
    @players << a_player
    #also @players.push(a_player)

  end

  def play
    puts "There are #{@players.size} players in #{@title}: "
    @players.each do |player|
      puts player

      case @die.roll
        when 1..2
          player.blam
        when 3..4
          #Do Nothing
          puts "Player #{player.name} was skipped!"
        when 5..6
          player.w00t
      end
      puts player
    end

  end

end