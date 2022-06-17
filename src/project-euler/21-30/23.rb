# Non-abundant sums
#
# https://projecteuler.net/problem=23

require 'prime'
require 'set'

def abundant?(number)
  proper_divisors(number).sum > number
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

def proper_divisors(number)
  divisors = divisors(number)

  divisors.pop
  divisors
end

range = 1.upto(28_123)

abundant_numbers = range.filter do |number|
  abundant?(number)
end

abundant_sum_numbers = range.filter do |number|
  abundant_numbers.any? do |a|
    break if a >= number

    minimum_b = abundant_numbers.bsearch do |b|
      a + b >= number
    end

    a + minimum_b == number
  end
end

non_abundant_sum_numbers =
  range.to_a - abundant_sum_numbers

puts(non_abundant_sum_numbers.sum) # => 4179871
