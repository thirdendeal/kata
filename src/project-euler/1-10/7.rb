# 10001st prime
#
# https://projecteuler.net/problem=7

require 'prime'

prime = Prime::TrialDivision.instance[10_001 - 1]

puts(prime) # => 104743
