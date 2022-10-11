# Amicable numbers
#
# https://projecteuler.net/problem=21

require 'prime'
require 'set'

def divisors(number)
  return [1] if number.zero?

  divisors = Set.new([1])

  number.prime_division.each do |prime, exponent|
    exponent.times do
      divisors.dup.each do |divisor|
        divisors.add(prime * divisor)
      end
    end
  end

  divisors.to_a
end

def proper_divisors(number)
  divisors = divisors(number)

  divisors.pop
  divisors
end

d = lambda do |number|
  proper_divisors(number).sum
end

numbers = 1.upto(10_000).filter do |a|
  b = d[a]

  a != b && d[b] == a
end

puts(numbers.sum) # => 31626
