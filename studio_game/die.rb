class Die

  attr_reader :number

  def initialize
    roll
  end

  def roll
     @number =  rand(1...6)
     @number
  end
end