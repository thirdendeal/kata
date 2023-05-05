# Distinct powers
#
# https://projecteuler.net/problem=29

distinct_powers = Set.new

2.upto(100) do |base|
  2.upto(100) do |exponent|
    distinct_powers.add(base**exponent)
  end
end

puts(distinct_powers.size) # => 9183
