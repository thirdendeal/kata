# Largest palindrome product
#
# https://projecteuler.net/problem=4

def palindrome?(object)
  object.to_s == object.to_s.reverse
end

def products(range)
  range.flat_map do |i|
    segment =
      i.upto(range.max)

    segment.map { |j| i * j }
  end
end

descending =
  products(100..999)
  .sort
  .reverse

palindrome = descending.find do |product|
  palindrome?(product)
end

puts(palindrome) # => 906609
