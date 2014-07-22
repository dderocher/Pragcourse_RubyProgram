
dash_length = 40

puts "#{'-' * dash_length}"
puts "Block example 1"
puts "#{'-' * dash_length}"

=begin
This illustrates an important rule: if there’s a variable inside a block with the same name as
a variable in the same scope outside the block, the two are the same—there’s only one variable
sum in the preceding program

this can lead to confusion if you do this unintentionally.  if sum has relevance outside, then
the var declared in the block would alter it. I say name all vars in block differently b_ ???
=end

sum = 0
[1,2,3,4].each do |value|
  square = value*value
  sum += square
end

puts sum



=begin
There are ways around the inside outside block var issue...

First, parameters to a block are always local to a block, even if they have the same name as
locals in the surrounding scope

Second, you can define block-­‐‑local variables by putting them after a semicolon in the block’s
parameter list

=end


puts "#{'-' * dash_length}"
puts "Block example 2"
puts "#{'-' * dash_length}"

value = 'some shape'
sum = 0
[1,2,3,4].each do |value|
  square = value*value
  sum += square

  puts value
end

puts value

puts "#{'-' * dash_length}"
puts "Block example 2"
puts "#{'-' * dash_length}"


puts "#{'-' * dash_length}"
puts "Block example 3"
puts "#{'-' * dash_length}"

# By making square block-­‐‑local, values assigned inside the block will not affect the value of
# the variable with the same name in the outer scope.

square  = 'some shape'
sum = 0
[1,2,3,4].each do |value; square|
  square = value*value
  sum += square
end

puts sum
puts square

########################################################
puts "#{'*' * 30}"
puts "Implementing Iterators"
puts "#{'*' * 30}"
#########################################################

puts "#{'-' * dash_length}"
puts "Iterators example 1"
puts "#{'-' * dash_length}"

def two_times
  yield
  yield
end

two_times {puts 'hello'}


=begin
In this example, the yield statement has a parameter. This value is passed to the associated
block. In the definition of the block, the argument list appears between vertical bars. In this
instance, the variable f receives the value passed to yield, so the block prints successive
members of the series.
=end
puts "#{'-' * dash_length}"
puts "Iterators example 3"
puts "#{'-' * dash_length}"

def fib_up_to(max)
  i1,i2 = 1,1 #parallel assignment
  while i1 <= max
    yield i1
    i1,i2 = i2, i1+i2
  end
end

fib_up_to(1000) {|f| print f, " "}

# Some iterators are common to many types of Ruby collections. Let’s look at three: each, collect,
# and find.

puts "#{"\n" + "-" * dash_length}"
puts "EACH Iterators example 1"
puts "#{'-' * dash_length}"

[1,2,3,4,5,6].each  {|i| puts i}


puts "#{"\n" + "-" * dash_length}"
puts "Block returning value example 1"
puts "#{'-' * dash_length}"

=begin
A block may also return a value to the method. The value of the last expression evaluated
in the block is passed back to the method as the value of the yield. This is how the find method
used by class Array works.
=end

puts [1, 3, 5, 7, 9].find {|v| v*v > 30 } # => 7

=begin
Another common iterator is collect (also known as map), which takes each element from the
collection and passes it to the block. The results returned by the block are used to construct
a new array. The following example uses the succ method, which increments a string value:
=end

puts "#{"\n" + "-" * dash_length}"
puts "Block returning value example 1"
puts "#{'-' * dash_length}"

myarray =  ['H','A','L'].collect {|x| x.succ }
puts myarray


########################################################
puts "\n#{'*' * dash_length}"
puts "Enumerators—External Iterators"
puts "#{'*' * dash_length}"
#########################################################

# You can create an Enumerator object by calling the to_enum method (or its synonym, enum_for)
# on a collection such as an array or a hash:

puts "#{"\n" + "-" * dash_length}"
puts "Enumerators—External Iterators example 1"
puts "#{'-' * dash_length}"

a = [1, 3, 'cat']
h = {a:"zebra" , b: "lion"}

enum_a = a.to_enum
enum_h = h.to_enum

print enum_a.next
print enum_h.next
print enum_a.next
print enum_h.next


# Most of the internal iterator methods—the ones that normally yield successive values to a
# block—will also return an Enumerator object if called without a block:

puts "#{"\n" + "-" * dash_length}"
puts "Enumerators—External Iterators example 2"
puts "#{'-' * dash_length}"


a = [1, 2, 'cat']
enum_a = a.each
puts  "#{enum_a.next}"
puts  "#{enum_a.next}"
puts  "#{enum_a.next}"

# loop is  smart when you use an Enumerator—when an enumerator object runs out of values inside
# a loop, the loop will terminate cleanly.


puts "#{"\n" + "-" * dash_length}"
puts "Enumerators—External Iterators example 3"
puts "#{'-' * dash_length}"


short_enum = [1,2,3].to_enum
long_enum = ('a'..'z').to_enum

loop do
  puts "#{short_enum.next} - #{long_enum.next}"
end

########################################################
puts "\n#{'*' * dash_length}"
puts "Enumerators Are Objects"
puts "#{'*' * dash_length}"
#########################################################

# This means you can do things programmatically with enumerators that
# aren’t easily done with regular loops.

puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Objects example 1"
puts "#{'-' * dash_length}"

result = []
['a','b','c'].each_with_index { |item, index| result << [item, index] }

puts result.inspect

puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Objects example 2"
puts "#{'-' * dash_length}"

result = []
'cat'.each_char.each_with_index { |item,index |  result << [item,index] }
puts result.inspect

#You can also create the Enumerator object explicitly—in this case we’ll create one that calls
# our string’s each_char method. We can call to_a on that enumerator to iterate over it:

enum = 'cat'.enum_for(:each_char)
puts enum.to_a.inspect

# If the method we’re using as the basis of our enumerator takes parameters, we can pass them
# to enum_for:
enum_in_threes = (1..10).enum_for(:each_slice,3)
puts enum_in_threes.to_a.inspect


########################################################
puts "\n#{'*' * dash_length}"
puts "Enumerators Are Generators and Filters"
puts "#{'*' * dash_length}"
#########################################################


puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Generators and Filters example 1"
puts "#{'-' * dash_length}"

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count +=1
    yielder.yield number
  end
end

5.times {print triangular_numbers.next, ' '}


puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Generators and Filters example 2"
puts "#{'-' * dash_length}"

# Enumerator objects are also enumerable (that is to say, the methods available to enumerable
# objects are also available to them). That means we can use Enumerable’s methods (such as
# first) on them:

p triangular_numbers.first(5)