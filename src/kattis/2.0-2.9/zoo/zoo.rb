# Un-bear-able Zoo
#
# https://open.kattis.com/problems/zoo

def get_groups(lines)
  Enumerator.new do |yielder|
    until lines.first == "0\n"
      group = lines.shift(
        lines.shift.to_i
      )

      yielder << group
    end
  end
end

line_groups = get_groups(ARGF.readlines)

noun_groups = line_groups.map do |group|
  group.map do |line|
    line.split.last.downcase
  end
end

noun_groups.each_with_index do |group, index|
  puts("List #{index + 1}:")

  group.tally.sort.each do |noun, count|
    puts("#{noun} | #{count}")
  end
end
