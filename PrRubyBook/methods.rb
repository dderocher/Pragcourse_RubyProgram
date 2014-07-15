#Variable-Length Argument Lists

def varargs(arg1, *arg2)
  puts "arg1 = #{arg1}.  variable lenght arg: #{arg2.inspect} "
end

varargs("one")
varargs("one",2)
varargs("one",2,3)

puts <<-HEREDOC
Methods and Blocks
when a method is called
it may be associated with a block. Normally, you call the block from within the method using
yield: \n
HEREDOC

puts "\nMethod Block example 1 \n--------------------"
def double(amt1)
  yield(amt1 * 2)
end

myvar = double(3) {|val| "I got #{val}"}
puts myvar

puts "\nMethod Block example 2 \n--------------------"
puts <<-HEREDOC
However, if the last parameter in a method definition is prefixed with an ampersand, any
associated block is converted to a Proc object, and that object is assigned to the parameter.
 This allows you to store the block for use later. \n
HEREDOC


class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end
  def get_tax(amount)
    "#@name on #{amount} = #{@block.call(amount) }"
  end
end

tc = TaxCalculator.new("Dave Tax") {|amt| amt * 0.05}

puts tc.get_tax(10) + "\n"


puts "\nMethod Multiple Parameters example 1 \n--------------------"

puts <<-HEREDOC_AGAIN
As the last case illustrates, if you give return multiple parameters, the method returns them
in an array. You can use parallel assignment to collect this return value
HEREDOC_AGAIN

def meth_three
  100.times do |num|
    square = num * num
    return num, square if square > 1000
  end
end

num, square = meth_three


puts "\n Splat! Expanding Collections in Method Calls example 1 \n--------------------"

puts <<-HEREDOC_AGAIN
When you call a method, you can convert any collection or enumerable object into its con-­‐‑
stituent elements and pass those elements as individual parameters to the method. Do this
by prefixing array arguments with an asterisk:
HEREDOC_AGAIN

def five(a,b,c,d,e)
  "I was passed #{a} #{b} #{c} #{d} #{e}"
end

puts "#{five(1,2,3,4,5)}"
puts "#{five(1, 2, 3, *['a', 'b'])}"
puts "#{five(*(10..14))}"

puts "\n Making Blocks More Dynamic example 1 \n----------------------------------"

puts <<-DAVE_COMMENT
If the last argument to a method is preceded by an ampersand, Ruby assumes that it is a Proc
object. It removes it from the parameter list, converts the Proc object into a block, and associates
it with the method.
DAVE_COMMENT

print "(t)imes or (p)lus: "
operator = gets
print "number:  "
number = Integer(gets)

#lambda returns a proc object that contains the defined expression
if operator = ~ /^t/
  calc = lambda {|n| n * number }
else
  calc = lambda {|n| n * number }
end

puts ((1..10).collect(&calc).join(", ")   )