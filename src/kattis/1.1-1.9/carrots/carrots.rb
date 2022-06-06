# Solving for Carrots
#
# https://open.kattis.com/problems/carrots

numbers =
  ARGF
  .readline
  .scan(/[[:digit:]]+/)

puts(numbers[1])
