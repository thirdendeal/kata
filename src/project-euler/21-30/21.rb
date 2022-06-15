# Amicable numbers
#
# https://projecteuler.net/problem=21

require 'prime'
require 'set'

def d(n)
  divisors = divisors(n)
  proper_divisors = divisors[0..-2]

  proper_divisors.sum
end

def divisors(number)
  return [1] if number.zero?

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

numbers = 1.upto(10_000).filter do |number_a|
  number_b = d(number_a)

  number_a != number_b && d(number_b) == number_a
end

puts(numbers.sum) # => 31626
