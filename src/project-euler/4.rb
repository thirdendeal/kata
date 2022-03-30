# Largest palindrome product
#
# https://projecteuler.net/problem=4

def palindrome?(object)
  string = object.to_s

  string == string.reverse
end

lower_bound = 100
upper_bound = 999

products = []

lower_bound.upto(upper_bound).each do |i|
  (i..upper_bound).each do |j|
    products << i * j
  end
end

descending = products.sort.reverse

palindrome = descending.find do |product|
  palindrome?(product)
end

puts(palindrome) # => 906609
