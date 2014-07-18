class BookInStock

  #Notice the use of symbols here which are just convenient ways of referencing names
  #this is just a shortcut to creating accessor methods.  it does not creat the instance vars...
  attr_reader :isbn
  attr_accessor :price

  def initialize(isbn,price)
    @isbn = isbn
    @price = Float(price)
  end

  def to_s
    "ISBN: #@isbn, price: #@price"
  end

  def price_in_cents
     Integer(price*100 + 0.5)
        # We multiply the floating-­‐‑point price by 100 to get the price in cents but then add 0.5 before converting
        # to an integer. Why? Because floating-­‐‑point numbers don’t always have an exact internal representation.
        # When we multiply 33.8 by 100, we get 3379.. The Integer method would truncate
        # this to 3379. Adding 0.5 before calling Int99999999999954525265eger rounds up the floating-­‐‑point value, ensuring we get the
        # best integer representation. This is a good example of why you want to use BigDecimal, not Float, in
        # financial calculations.

  end

  def price_in_cents=(cents)
    @price =cents / 100.0
  end
end

=begin
book = BookInStock.new("isbn1", 33.80)
puts "ISBN = #{book.isbn}"
puts "Price = #{book.price}"
puts "Price in cents = #{book.price_in_cents}"

book.price_in_cents = 1234
puts "Price = #{book.price}"
puts "Price in cents = #{book.price_in_cents}"
=end
