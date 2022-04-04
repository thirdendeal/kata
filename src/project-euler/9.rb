# Special Pythagorean triplet
#
# https://projecteuler.net/problem=9

def find_triplet(triplet_sum)
  range(triplet_sum, 3).find do |c|
    c_squared  = c**2
    difference = triplet_sum - c

    range(difference, 2).find do |b|
      a = difference - b

      return [a, b, c] if c_squared == a**2 + b**2
    end
  end
end

def range(total, parts)
  upper_bound =
    total - triangular(parts - 1)

  lower_bound =
    total / parts + (parts / 2)

  (lower_bound).upto(upper_bound)
end

def triangular(number)
  number * (number + 1) / 2
end

triplet = find_triplet(1000)
product = triplet.reduce(&:*)

puts(product) # => 31875000
