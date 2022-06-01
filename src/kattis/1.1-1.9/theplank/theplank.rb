# The Plank
#
# https://open.kattis.com/problems/theplank

planks = [1, 2, 3]

max_length =
  ARGF
  .readline
  .to_i

minimum = max_length.fdiv(planks.max).ceil
maximum = max_length

lengths = minimum.upto(maximum)

permutations = lengths.flat_map do |length|
  planks
    .repeated_permutation(length)
    .to_a
end

arrangements = permutations.filter do |permutation|
  permutation.sum == max_length
end

puts(arrangements.size)
