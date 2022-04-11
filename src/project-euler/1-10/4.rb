# Largest palindrome product
#
# https://projecteuler.net/problem=4

def palindrome?(object)
  string = object.to_s

  string == string.reverse
end

def products(range)
  range.flat_map do |i|
    i.upto(range.max).map { |j| i * j }
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
