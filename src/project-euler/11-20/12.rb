# Highly divisible triangular number
#
# https://projecteuler.net/problem=12

require 'prime'

def triangle_numbers
  position = 1

  Enumerator.produce(1) do |previous|
    position += 1

    previous + position
  end
end

def divisors(number)
  pairs = number.prime_division

  factors = pairs.map do |_prime, exponent|
    exponent + 1
  end

  factors.reduce(1, &:*)
end

triangle_number = triangle_numbers.find do |number|
  divisors(number) > 500
end

puts(triangle_number) # => 76576500
