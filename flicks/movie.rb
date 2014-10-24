

class Movie


  attr_accessor :title
  attr_reader :rank


  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    #puts "Creates a movie object with title #{title} and rank #{rank}"
  end

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end

  #overrides default to_s
  def to_s
    "#{@title} has a rank of #{@rank}"
  end


end