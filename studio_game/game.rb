require_relative 'game_turn'

class Game

  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
    #@die = Die.new
end
  def add_player(a_player)
    @players << a_player
    #also @players.push(a_player)
  end

  def play
    puts "There are #{@players.size} players in #{@title}: "
    @players.each do |player|
       GameTurn.take_turn(player)
       puts player
    end

  end

end