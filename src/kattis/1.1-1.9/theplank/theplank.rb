# The Plank
#
# https://open.kattis.com/problems/theplank

planks = [1, 2, 3]

length =
  ARGF
  .readline
  .to_i

minimum = length.fdiv(planks.max).ceil
maximum = length

range = minimum.upto(maximum)

arrangements = range.flat_map do |n|
  permutations =
    planks.repeated_permutation(n)

  permutations.filter do |permutation|
    permutation.sum == length
  end
end

puts(arrangements.size)
