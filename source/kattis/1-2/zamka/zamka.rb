# Zamka
#
# https://open.kattis.com/problems/zamka

minimum = ARGF.readline.to_i
maximum = ARGF.readline.to_i

sum = ARGF.readline.to_i

minimal = minimum.upto(maximum).find do |number|
  number.digits.sum == sum
end

maximal = maximum.downto(minimum).find do |number|
  number.digits.sum == sum
end

puts(minimal, maximal)
