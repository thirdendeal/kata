# Solving for Carrots
#
# https://open.kattis.com/problems/carrots

problems_solved =
  ARGF
  .each_line
  .first
  .scan(/[[:digit:]]+/)
  .slice(1)

puts(problems_solved)
