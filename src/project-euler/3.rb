# Largest prime factor
#
# https://projecteuler.net/problem=3

require 'prime'

factorization =
  Prime.prime_division(600_851_475_143)

prime, _exponent = factorization.last

puts(prime) # => 6857
