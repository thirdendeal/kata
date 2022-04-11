# Zoom
#
# https://open.kattis.com/problems/zoom

def get_nth(array, nth)
  indeces = nth.step(
    by: nth, to: array.size
  )

  indeces.map do |index|
    array[index - 1]
  end
end

nth =
  ARGF
  .readline
  .split
  .last
  .to_i

line = ARGF.readline

numbers = get_nth(line.split, nth)

puts(numbers.join(' '))
