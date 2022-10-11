# Un-bear-able Zoo
#
# https://open.kattis.com/problems/zoo

def list_iterator(lines)
  until lines.first == "0\n"
    chunk = lines.shift(
      lines.shift.to_i
    )

    list = chunk.map do |line|
      line.split.last.downcase
    end

    yield list
  end
end

lines = ARGF.readlines
count = 1

list_iterator(lines) do |list|
  puts("List #{count}:")

  list.tally.sort.each do |noun, tally|
    puts("#{noun} | #{tally}")
  end

  count += 1
end
