# PRIME1 - Prime Generator
#
# https://www.spoj.com/problems/PRIME1/

require 'prime'
require 'stringio'

bounds = ARGF.first(
  ARGF.readline.to_i
)

primes = bounds.map do |line|
  lower, upper =
    line
    .scan(/[[:digit:]]+/)
    .first(2)
    .map(&:to_i)

  Prime.each(upper).grep(lower..)
end

io = StringIO.new

primes.each do |array|
  io.puts(array)
  io.puts
end

puts(io.string.chomp)
