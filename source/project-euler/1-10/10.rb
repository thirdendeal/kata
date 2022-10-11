# Summation of primes
#
# https://projecteuler.net/problem=10

require 'prime'

upper_bound = 2_000_000 - 1

primes =
  Prime.each(upper_bound)

puts(primes.sum) # => 142913828922
