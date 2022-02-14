# Solving for Carrots
#
# https://open.kattis.com/problems/carrots

carrots_number =
  ARGF
  .each_line
  .first
  .scan(/[[:digit:]]+/)
  .slice(1)

puts(carrots_number)
