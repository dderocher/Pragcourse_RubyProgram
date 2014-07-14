#Variable-Length Argument Lists

def varargs(arg1, *arg2)
  puts "arg1 = #{arg1}.  variable lenght arg: #{arg2.inspect} "
end

varargs("one")
varargs("one",2)
varargs("one",2,3)

#Methods and Blocks
def double(amt1)
  yield(amt1 * 2)
end

myvar = double(3) {|val| "I got #{val}"}
puts myvar