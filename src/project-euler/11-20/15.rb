# Lattice paths
#
# https://projecteuler.net/problem=15

def factorial(number)
  number
    .downto(1)
    .reduce(:*)
end

def choose(n, k)
  numerator   = factorial(n)
  denominator = factorial(k) * factorial(n - k)

  numerator / denominator
end

side = 20

routes =
  choose(2 * side, side)

puts(routes) # => 137846528820
