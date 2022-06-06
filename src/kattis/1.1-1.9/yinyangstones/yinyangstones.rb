# Yin and Yang Stones
#
# https://open.kattis.com/problems/yinyangstones

characters =
  ARGF
  .readline
  .chars

tally = characters.tally

output =
  if tally['W'] == tally['B']
    1
  else
    0
  end

puts(output)
