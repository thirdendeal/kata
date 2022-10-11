# Lattice paths
#
# https://projecteuler.net/problem=15

def factorial(number)
  number.downto(1).reduce(:*)
end

def choose(elements, combinations)
  numerator   = factorial(elements)
  denominator = factorial(combinations) * factorial(elements - combinations)

  numerator / denominator
end

side = 20

routes =
  choose(2 * side, side)

puts(routes) # => 137846528820
