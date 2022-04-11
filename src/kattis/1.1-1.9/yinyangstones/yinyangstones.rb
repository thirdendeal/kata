# Yin and Yang Stones
#
# https://open.kattis.com/problems/yinyangstones

characters =
  ARGF
  .readline
  .chars

tally = characters.tally

black = tally['B']
white = tally['W']

difference = white - black

output =
  if difference.zero?
    1
  else
    0
  end

puts(output)
