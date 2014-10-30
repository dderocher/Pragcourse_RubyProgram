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

  it 'has a capitalized name' do
    player = Player.new('larry',150)
    expect(player.name).to eq('Larry')
  end

  it 'has an initial health'
  it 'has a string representation'
  it 'computes a score as the sum of its health and length of name'
  it 'increases health by 15 when w00ted'
  it 'decreases health by 10 when blammed'

end