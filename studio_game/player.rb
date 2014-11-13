class Player

  attr_reader :health
  attr_accessor :name


  #The initialize method is a special "constructor" method. You never call it directly.
  def initialize(init_name, init_health=100)
    self.name = init_name
    @health = init_health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end


  def score
    @name.length + health
  end


  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got Blammed!"
  end

  def w00t
    @health += 15
    puts  "#{@name} got w00ted!"
  end

  def strong?

    if @health > 100
      true
    else
      false
    end

  end
end #class Player


#Example of how to wing in some testcoce
if __FILE__ == $0

    puts '--------TEST CODE-------'
    player = Player.new("moe")
    puts player.name
    puts player.health
    player.w00t
    puts player.health
    player.blam
    puts player.health
 end