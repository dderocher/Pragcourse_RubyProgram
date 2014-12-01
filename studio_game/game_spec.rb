require 'rspec'
require_relative 'spec_helper'
require_relative 'game'
require_relative 'player'
require_relative 'die'
describe Game do

  before do
    #set up game
    @game = Game.new('ShazamGame')

    # set up player
    @initial_health = 100
    @player = Player.new('Batman',100)

    @game.add_player(@player)
  end
=begin
  If a low number (1 or 2) is rolled, we'll blam the player because low rollers aren't very lucky.
  If a medium number (3 or 4) is rolled, we'll skip the player—we won't change their health value. Instead, we'll print out something like "Curly was skipped."
 If a high number (5 or 6) is rolled, we'll w00t the player (high fives for the high rollers!)
=end

  it  'w00ts a player if a high number is rolled' do
    #Die.any_instance.stub(:roll).and_return(5)
    allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @game.play()
    expect(@player.health).to eq(@initial_health + 15)

  end

  it ' skips player if a medium number is rolled' do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play()
    expect(@player.health).to eq(@initial_health)
  end

  it ' blams  player if a low number is rolled' do
    allow_any_instance_of(Die).to receive(:roll).and_return(1)
    @game.play()
    expect(@player.health).to eq(@initial_health - 10)
  end

end

