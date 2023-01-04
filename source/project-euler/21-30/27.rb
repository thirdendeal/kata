# Quadratic primes
# ----------------------------------------------------------------------
#
# https://projecteuler.net/problem=27

require 'prime'

# ----------------------------------------------------------------------

INPUT   = (0..)

A_RANGE = (-999..999)
B_RANGE = (-1000..1000)

# ----------------------------------------------------------------------

results = []

A_RANGE.each do |a|
  B_RANGE.each do |b|
    streak = INPUT.find_index do |number|
      !Prime.prime?((number**2) + (a * number) + b)
    end

    results << [a, b, streak]
  end
end

# ----------------------------------------------------------------------

a, b, = results.max_by(&:last)

puts(a * b) # => -59231
