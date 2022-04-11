# Smallest multiple
#
# https://projecteuler.net/problem=5

def divisible?(dividend, divisors)
  divisors = Array(divisors)

  divisors.all? do |divisor|
    dividend.modulo(divisor).zero?
  end
end

multiples = 2520.step(by: 2520)

smallest = multiples.find do |multiple|
  divisible?(multiple, 11..20)
end

puts(smallest) # => 232792560
