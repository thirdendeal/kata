# Odd Echo
#
# https://open.kattis.com/problems/oddecho

def get_nth(array, nth)
  indeces = nth.step(
    by: nth, to: array.size
  )

  indeces.each do |index|
    yield array[index - 1]
  end
end

lines = ARGF.readlines

get_nth(lines, 2) do |line|
  puts(line)
end
