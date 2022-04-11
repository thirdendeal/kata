# Solving for Carrots
#
# https://open.kattis.com/problems/carrots

numbers =
  ARGF
  .first
  .scan(/[[:digit:]]+/)

puts(numbers[1])
