# Lexicographic permutations
#
# https://projecteuler.net/problem=24

digits = 0.upto(9)

millionth =
  digits
  .to_a
  .permutation
  .take(1_000_000)
  .last

puts(millionth.join) # => 2783915460
