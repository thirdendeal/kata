# Counting Sundays
#
# https://projecteuler.net/problem=19

require 'date'

twentieth_century = Range.new(
  Date.parse('1 Jan 1901'),
  Date.parse('31 Dec 2000')
)

count = twentieth_century.count do |date|
  date.sunday? && date.day == 1
end

puts(count) # => 171
