# Names scores
#
# https://projecteuler.net/problem=22

def alphabetical_only?(string)
  !string.match(/[^[[:alpha:]]]/i)
end

def alphabetical_value(string)
  return unless alphabetical_only?(string)

  bytes = string.upcase.bytes

  bytes.sum - (64 * string.size)
end

text =
  File.read("#{__dir__}/names.txt")

names =
  text
  .delete_prefix('"')
  .delete_suffix('"')
  .split('","')

scores = names.sort.map.with_index(1) do |name, index|
  alphabetical_value(name) * index
end

puts(scores.sum) # => 871198282
