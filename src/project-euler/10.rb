# Summation of primes
#
# https://projecteuler.net/problem=10

require 'prime'

primes =
  Prime.each(2_000_000 - 1)

puts(primes.sum) # => 142913828922
