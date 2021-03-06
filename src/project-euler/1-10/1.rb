# Multiples of 3 or 5
#
# https://projecteuler.net/problem=1

numbers = 1.upto(999)

multiples = numbers.filter do |number|
  number.modulo(3).zero? ||
    number.modulo(5).zero?
end

puts(multiples.sum) # => 233168
