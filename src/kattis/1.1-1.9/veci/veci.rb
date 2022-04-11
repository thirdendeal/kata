# Veci
#
# https://open.kattis.com/problems/veci

number =
  ARGF
  .readline
  .to_i

permutations =
  number
  .digits
  .permutation
  .map(&:join)
  .map(&:to_i)
  .sort

smallest = permutations.find do |permutation|
  permutation > number
end

puts(smallest || 0)
