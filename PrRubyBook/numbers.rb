num = 10001

4.times do
  puts "#{num.class}: #{num}"
  num *= num
end

puts "\nLooping using numbers\n"
puts "--------------------------------\n"

3.times {print 'x ' }
puts "\n"
1.upto(5) {|i| print i, " "}
puts "\n"
99.downto(85) {|i| print i," "}

puts "\n"
50.step(80,5) {|i | print i," "}

puts "\n"
10.downto(7).each_with_index { |num,index | puts "#{ index}: #{num}" }


=begin
Looping using numbers
--------------------------------
x x x
1 2 3 4 5
99 98 97 96 95 94 93 92 91 90 89 88 87 86 85
50 55 60 65 70 75 80
0: 10
1: 9
2: 8
3: 7

Process finished with exit code 0
=end

