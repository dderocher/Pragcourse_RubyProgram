#Demonstrtes that double quoted strings can be contain expressions of multiple statements

puts "now is #{def the(a)
                            ' the ' + a
                        end
                       the('time')

                       } for all bad coders..."
# now is  the time for all bad coders...
# Process finished with exit code 0


#three more ways to construct string literals
#1.
puts %q/general single-quoted string/           # => general single-quoted string
#2.
puts %Q!general double-quoted string!  # => general double-quoted string
  puts %Q{Seconds/day: #{24*60*60}}    # => Seconds/day: 86400

#3. Finally, you can construct a string using a here document:
puts "\n HERE DOCUMENT  EXAMPLE 1"
string = <<END_OF_STRING
    The body of the string is the input lines up to
    one starting with the same text that followed the '<<'
END_OF_STRING
#Notice the terminator has to begin in column 1
puts string

#In this example you can indent terminator with minus sign
puts "\n HERE DOCUMENT  EXAMPLE 2"
string = <<-END_OF_STRING
    The body of the string is the input lines up to
    one starting with the same text that followed the '<<'
     END_OF_STRING
     #Notice the terminator does not  begin in column 1
puts string

puts "\n HERE DOCUMENT  EXAMPLE 3"
print <<-string1, <<-string2
 this is the text of the first document
string1
    this is the text of the second document
    string2


puts "\n*******STRINGS AND ENCODINGS*********"

plain_string = 'dog'
puts RUBY_VERSION
puts "Encoding of #{plain_string.inspect} is #{plain_string.encoding}"