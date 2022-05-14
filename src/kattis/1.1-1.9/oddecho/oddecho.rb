# Odd Echo
#
# https://open.kattis.com/problems/oddecho

def get_nth(array, nth)
  positions = nth.step(
    by: nth, to: array.size
  )

  positions.map do |position|
    array[position - 1]
  end
end

lines = get_nth(ARGF.readlines, 2)

puts(lines)
