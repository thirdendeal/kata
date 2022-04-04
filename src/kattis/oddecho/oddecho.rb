# Odd Echo
#
# https://open.kattis.com/problems/oddecho

def get_nth(array, nth)
  indeces = nth.step(
    by: nth, to: array.size
  )

  indeces.map do |index|
    array[index - 1]
  end
end

lines = get_nth(
  ARGF.readlines, 2
)

lines.each do |line|
  puts(line)
end
