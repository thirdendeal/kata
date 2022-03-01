# A Different Problem
#
# https://open.kattis.com/problems/different

ARGF.each_line do |line|
  minuend, subtrahend =
    line
    .scan(/[[:digit:]]+/)
    .first(2)
    .map(&:to_i)

  difference = minuend - subtrahend

  puts(difference.magnitude)
end
