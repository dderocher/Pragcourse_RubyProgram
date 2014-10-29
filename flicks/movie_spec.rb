require 'rspec'
require_relative 'movie'

=begin Template

describe 'My behaviour' do

  it 'should do something' do

    true.should == false
  end
end

=end


describe Movie do

  movie = Movie.new("goonies",10)

  it "has  capitalized title" do

    #  movie .title.should == "Goonies"
    #expect(movie.title).to eq("Goonies")
    expect(movie.title)  ==  "Goonies"
  end

  it "has an initial rank" do
    expect(movie.rank) == 10
  end

  it 'has a string representation'
end



