# Zoom
#
# https://open.kattis.com/problems/zoom

def get_nth(array, nth)
  positions = nth.step(
    by: nth, to: array.size
  )

  positions.map do |position|
    array[position - 1]
  end
end

nth =
  ARGF
  .readline
  .split
  .last
  .to_i

sequence =
  ARGF
  .readline
  .split

numbers = get_nth(sequence, nth)

puts(numbers.join(' '))
