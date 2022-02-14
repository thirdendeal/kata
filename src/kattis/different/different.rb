# A Different Problem
#
# https://open.kattis.com/problems/different

ARGF.each_line do |line|
  numbers =
    line
    .scan(/[[:digit:]]+/)
    .map(&:to_i)

  difference = numbers[0] - numbers[1]

  puts(difference.abs)
end
