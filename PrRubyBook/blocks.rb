
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
puts


puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Generators and Filters example 2"
puts "#{'-' * dash_length}"

# Enumerator objects are also enumerable (that is to say, the methods available to enumerable
# objects are also available to them). That means we can use Enumerable’s methods (such as
# first) on them:

p triangular_numbers.first(5)

=begin
You have to be slightly careful with enumerators that can generate infinite sequences. Some
of the regular Enumerator methods such as count and select will happily try to read the whole
enumeration before returning a result. If you want a version of select that works with infinite
sequences, in Ruby 1.9 you’ll need to write it yourself. (⇡New in 2.0⇣ Ruby 2 users have a better option,
which we discuss in a minute.)

Here’s a version you can do by hand  (1.9) that gets passed an enumerator and a block
and returns a new enumerator containing values from the original for which the block returns
 true. We’ll use it to return triangular numbers that are multiples of 10.
=end

puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Generators and Filters example 3"
puts "#{'-' * dash_length}"


def infinite_select(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if block.call(value)
    end
  end
end

p infinite_select(triangular_numbers) {|val|  val %10 ==0}.first(10)

=begin
The above can be made  more  convenient by adding filters such as infinite_select directly to the Enumerator class.
Here’s an example that returns the first five triangular numbers that are multiples of 10 and
 that have the digit 3 in them:
=end

puts "#{"\n" + "-" * dash_length}"
puts "Enumerators Are Generators and Filters example 4"
puts "#{'-' * dash_length}"

class Enumerator
  def infinite_select(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

p triangular_numbers.infinite_select {|val| val%10==0}
                               .infinite_select {|val| val.to_s =~ /3/}
                               .first(5)




########################################################
puts "\n#{'*' * dash_length}"
puts "Lazy Enumerators in Ruby 2"
puts "#{'*' * dash_length}"
#########################################################

=begin
Lazy Enumerators in Ruby 2  ⇡New in 2.0⇣
As we saw in the previous section, the problem with enumerators that generate infinite
sequences is that we have to write special, non-­‐‑greedy, versions of methods such as select.
 Fortunately, if you’re using Ruby 2.0, you have this support built in.

none of the lazy versions of the methods actually consume any data from the collection until that
data is requested, and then they only consume enough to satisfy that request

To work this magic, the lazy versions of the various methods do not return arrays of data.
Instead, each returns a new enumerator that includes its own special processing

The result is that if you
chain a bunch of lazy enumerator methods, what you end up with is a chain of enumera-­‐‑
tors

=end


# Let’s play with this a little. To start, let’s add a helper method to the Integer class that generates
# a stream of integers

puts "#{"\n" + "-" * dash_length}"
puts "Lazy Enumerators in Ruby 2 example 1"
puts "#{'-' * dash_length}"


def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop {yielder.yield(n +=1)}
  end.lazy #convert the basic generator into a lazy enumerator with the call to lazy after the end of the block.
end

p Integer.all.first(10)

=begin
 Calling the first method on this returns the numbers 1 through 10, but this doesn’t exercise
 the method’s lazy characteristics. Let’s instead get the first 10 multiples of three.

NOTE:
Without the lazy enumerator, the call to select would effectively never return, as select would
try to read all the values from the generator. But the lazy version of select only consumes
values on demand, and in this case the subsequent call to first only asks for 10 values

=end
puts "#{"\n" + "-" * dash_length}"
puts "Lazy Enumerators in Ruby 2 example 2"
puts "#{'-' * dash_length}"

p Integer
  .all
  .select {|i| (i % 3).zero?}
  .first(10)


########################################################
puts "\n#{'*' * dash_length}\nBlocks for Transactions\n#{'*' * dash_length}\n"
#########################################################


# you’ll often open a file, do something with its contents, and then
# ensure that the file is closed when you finish.

puts "#{"\n" + "-" * dash_length} \nBlocks for Transactions example 1\n#{'-' * dash_length}\n"

class File
  #*args  meaning collect the actual parameters passed to the method into an array named args.
  def self.open_and_process(*args)
    f = self.open(*args)
    yield f
    f.close()
  end
end

File.open_and_process("testfile","r") do |file|
  while line = file.gets
    puts line
  end
end

########################################################
puts "\n#{'*' * dash_length}\nBlocks Can Be Objects\n#{'*' * dash_length}\n"
#########################################################
=begin
If the last parameter in a method definition is prefixed with an ampersand (such as &action),
Ruby looks for a code  block whenever that method is called. That code block is converted to
 an object of class Proc  and assigned to the parameter. You can then treat the parameter
 as any other variable.
=end

puts "#{"\n" + "-" * dash_length} \nBlocks Can Be Objects example 1\n#{'-' * dash_length}\n"

class ProcExample
  def initialize(&action)
    @stored_proc = action
  end
  def use_proc(parameter)
    @stored_proc.call(parameter)
  end
end

eg = ProcExample.new {|param| puts "The parameter is  #{param}"}
eg.use_proc(99)


=begin
If a block can be turned
into an object by adding an ampersand parameter to a method, what happens if that method
then returns the Proc object to the caller?
=end

puts "#{"\n" + "-" * dash_length} \nBlocks Can Be Objects example 2\n#{'-' * dash_length}\n"

def create_block_object (&block)
  block
end

bo = create_block_object {|param| puts "You called me with #{param}"}

bo.call 100
bo.call "hello"

#lambda and Proc.new take a block and return an object of class Proc.
puts "#{"\n" + "-" * dash_length} \nBlocks Can Be Objects example 3\n#{'-' * dash_length}\n"

bo2 = lambda  {|param| puts "You called me with #{param}"}
bo2.call 100
bo2.call "hello"


########################################################
puts "\n#{'*' * dash_length}\nBlocks Can Be Closures\n#{'*' * dash_length}\n"
#########################################################
#  closure—variables in the surrounding scope that are referenced in a block
# remain accessible for the life of that block and the life of any Proc object  created from that block.

puts "#{"\n" + "-" * dash_length} \nBlocks Can Be Closures example 1\n#{'-' * dash_length}\n"

def n_times(thing)
  lambda {|n| thing * n}
end

p1 = n_times(23)
puts p1.call(3)

p1 = n_times('hello')
puts p1.call(3)

puts "#{"\n" + "-" * dash_length} \nBlocks Can Be Closures example 2\n#{'-' * dash_length}\n"

def mydoubler
  value = 1
  lambda {value += value}
end

doubler = mydoubler

puts doubler.call
puts doubler.call
puts doubler.call
puts doubler.call


########################################################
puts "\n#{'*' * dash_length}\nAn Alternative Notation\n#{'*' * dash_length}\n"
#########################################################

=begin
Alternative Notation
The -> form is more compact than using lambda and seems to be in favor when you want to
pass one or more Proc objects to a method
=end


puts "#{"\n" + "-" * dash_length} \nAn Alternative Notation example 1 \n#{'-' * dash_length}\n"

proc1 = -> arg {puts "In proc1 with #{arg}"}
puts proc1.call 'ant'

proc2 = -> arg1,arg2 {puts "In proc2 with #{arg1} and #{arg2}"}
puts proc2.call 'buzzy', 'bee'

puts "#{"\n" + "-" * dash_length} \nAn Alternative Notation example 2 \n#{'-' * dash_length}\n"

def my_if(condition, then_clause_proc, else_clause_proc )
  if condition
    then_clause_proc.call
  else
    else_clause_proc.call
  end
end

5.times do |val|
  my_if val < 2, -> {puts "#{val} is small"}, ->{ puts "#{val} is big "}
end