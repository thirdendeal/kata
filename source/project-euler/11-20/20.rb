# Factorial digit sum
#
# https://projecteuler.net/problem=20

def factorial(number)
  number.downto(1).reduce(:*)
end

factorial = factorial(100)

puts(factorial.digits.sum) # => 648
