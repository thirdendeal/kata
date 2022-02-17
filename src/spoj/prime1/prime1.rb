# PRIME1 - Prime Generator
#
# https://www.spoj.com/problems/PRIME1/

require 'prime'
require 'stringio'

head = ARGF.first
body = ARGF.first(head.to_i)

to_puts = body.map do |line|
  lower, upper =
    line
    .scan(/[[:digit:]]+/)
    .map(&:to_i)

  generator = Prime.each(upper)

  generator.grep(lower..)
end

io = StringIO.new

to_puts.each do |array|
  io.puts(array)
  io.puts
end

puts(io.string.chomp)
