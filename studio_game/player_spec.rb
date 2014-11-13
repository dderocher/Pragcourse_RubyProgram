require 'rspec'
require_relative 'spec_helper'

require_relative 'player'

=begin
   The objective of this exercise is to be able to write expectations for the following behaviors of the Player class:

   has a capitalized name
   has an initial health
   has a string representation
   computes a score as the sum of its health and length of name
   increases health by 15 when w00ted
   decreases health by 10 when blammed
=end




describe Player do

  before do
    @player = Player.new('larry',150)
    @initial_health = @player.health
  end

  it 'has a capitalized name' do
     expect(@player.name).to eq('Larry')
  end

  it 'has an initial health' do
    expect(@player.health).to eq(150)
  end

  it 'has a string representation' do
    expect(@player.to_s).to eq( "I'm Larry with a health of 150 and a score of 155.")
  end

  it 'computes a score as the sum of its health and length of name' do
    expect(@player.score).to eq(155)
  end

  it 'increases health by 15 when w00ted' do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam

    expect(@player.health).to eq(@initial_health - 10)
  end

  context 'having a health of greater than 100' do

    before do
      @player = Player.new('larry',150)
    end

    it 'is a strong player' do
      expect(@player.strong?).to eq(true)
    end


  end

end