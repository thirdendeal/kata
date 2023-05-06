# Digit fifth powers
#
# https://projecteuler.net/problem=30

numbers = []
number  = 2

loop do
  digits = number.digits.reverse
  sum = 0

  overflow = digits.find_index do |digit|
    (sum += digit**5) > number
  end

  if overflow
    magnitude = 10**(digits.size - overflow)

    number += magnitude # magnitude jump
    number -= number % magnitude # zeroing thereafter
  else
    numbers << number if sum == number

    number += 1
  end

  # The lowest 6-digit number is already out of reach
  #
  # 1_000_000 > 6 * (9**5)

  break if number >= 1_000_000
end

puts(numbers.sum) # => 443839
