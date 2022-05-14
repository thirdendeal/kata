# Special Pythagorean triplet
#
# https://projecteuler.net/problem=9

triplets = Enumerator.new do |yielder|
  3.step do |c|
    c_squared = c**2

    (c - 1).downto(2) do |b|
      b_squared = b**2

      (b - 1).downto(1) do |a|
        sum = a**2 + b_squared

        break if sum < c_squared

        yielder << [a, b, c] if sum == c_squared
      end
    end
  end
end

special_triplet = triplets.find do |triplet|
  triplet.sum == 1000
end

product = special_triplet.reduce(&:*)

puts(product) # => 31875000
