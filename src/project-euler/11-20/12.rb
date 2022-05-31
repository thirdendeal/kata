# Highly divisible triangular number
#
# https://projecteuler.net/problem=12

require 'prime'
require 'set'

def triangle_numbers(number)
  number -= 1

  Enumerator.produce do
    number += 1

    (number**2 + number) / 2
  end
end

def divisors(number)
  divisors = SortedSet.new([1])

  number.prime_division.each do |prime, exponent|
    exponent.times do
      divisors.each do |divisor|
        divisors.add(prime * divisor)
      end
    end
  end

  divisors.to_a
end

sequence = triangle_numbers(1)

triangle_number = sequence.find do |number|
  divisors = divisors(number)

  divisors.size > 500
end

puts(triangle_number) # => 76576500
