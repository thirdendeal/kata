# Arithmetic
#
# https://open.kattis.com/problems/arithmetic

def hexadecimal(octal_group)
  octal_group
    .join
    .to_i(8)
    .to_s(16)
end

octal_stream =
  ARGF
  .readline
  .chomp
  .chars
  .each_slice(4)

octal_stream.each_with_index do |octal_group, index|
  chunk =
    hexadecimal(octal_group)
    .upcase

  chunk = chunk.rjust(3, '0') unless index.zero?

  print(chunk)
end

puts
