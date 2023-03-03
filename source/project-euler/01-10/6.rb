# Sum square difference
#
# https://projecteuler.net/problem=6

numbers = 1.upto(100)
squares = numbers.map { |n| n**2 }

difference =
  (numbers.sum**2) - squares.sum

puts(difference) # => 25164150
