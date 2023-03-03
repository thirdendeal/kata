# Largest prime factor
#
# https://projecteuler.net/problem=3

require 'prime'

pairs = 600_851_475_143.prime_division

prime, _exponent = pairs.last

puts(prime) # => 6857
